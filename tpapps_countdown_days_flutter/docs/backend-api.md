# Countdown Backend API

This document specifies the REST contract the Flutter app talks to for its
online features: third-party sign-in, cloud sync of countdowns, and QR share /
import. The **client side is implemented** in `lib/data/remote/` (`RemoteApi`
interface, `DioRemoteApi` implementation, DTOs, mappers) and exercised in tests
against `FakeRemoteApi`. The **server implementing this contract is out of
scope** for this repository — this document is the source of truth for whoever
builds it, and for the Flutter client's expectations.

- App phase: cloud features are architected and the client layer is built, but
  not yet wired into the UI (see Phase 2 in the project plan).
- The wire types below correspond 1:1 to the Dart DTOs in
  `lib/data/remote/dto/`.

---

## 1. Conventions

| Aspect | Value |
| --- | --- |
| Base URL | `https://api.countdown.example.com` (configurable, `ApiConfig.baseUrl`) |
| Versioning | Path prefix `/v1` |
| Content type | `application/json; charset=utf-8` |
| Auth | `Authorization: Bearer <accessToken>` on all endpoints except `POST /v1/auth/*` and `GET /v1/shares/{code}` |
| Timestamps | Integer **epoch milliseconds, UTC** (fields suffixed `Ms`) |
| Enums | Lower-camel strings, exactly the Dart enum names (e.g. `calendarType: "lunar"`, `precision: "millisecond"`) |
| IDs | Client-generated UUID v4 strings (offline-first: the client owns the id) |
| Idempotency | `Idempotency-Key: <uuid>` header honored on `POST /v1/sync` and `POST /v1/shares` |
| Concurrency | Last-write-wins by `updatedAtMs` (see §6) |

### Error envelope

Non-2xx responses return:

```json
{ "error": { "code": "invalid_request", "message": "Human readable", "details": {} } }
```

| HTTP | `code` | Meaning |
| --- | --- | --- |
| 400 | `invalid_request` | Malformed body / missing field |
| 401 | `unauthenticated` | Missing/expired access token → refresh and retry |
| 403 | `forbidden` | Token valid but not allowed |
| 404 | `not_found` | Unknown id / share code |
| 409 | `conflict` | Optimistic-concurrency failure (stale `updatedAtMs`) |
| 410 | `share_expired` | Share code past `expiresAtMs` |
| 429 | `rate_limited` | Back off; see `Retry-After` header |
| 5xx | `server_error` | Retry with backoff |

### Rate limits

Default 60 req/min/user for `/v1/sync`, 600 req/min/user overall. Exceeding
returns `429` with a `Retry-After` (seconds) header.

---

## 2. Schemas

### Countdown  (`CountdownDto`)

```json
{
  "id": "0d4b…-uuid",
  "title": "Mom's birthday",
  "note": "call her",
  "targetMs": 1893456000000,
  "allDay": true,
  "calendarType": "solar",
  "lunarLeapMonth": false,
  "direction": "countdown",
  "precision": "day",
  "repeatRule": "lunarYearly",
  "repeatInterval": 1,
  "colorValue": 4278222847,
  "icon": "🎂",
  "pinned": false,
  "sortOrder": 0,
  "reminders": [ /* Reminder[] */ ],
  "createdAtMs": 1710000000000,
  "updatedAtMs": 1710000009999,
  "deleted": false
}
```

| Field | Type | Notes |
| --- | --- | --- |
| `id` | string(uuid) | Primary key, client-generated |
| `title` | string | 1–200 chars |
| `note` | string? | Nullable |
| `targetMs` | int | Solar instant of the (first/next) occurrence, epoch ms UTC |
| `allDay` | bool | Time-of-day ignored when true |
| `calendarType` | enum | `solar` \| `lunar` |
| `lunarLeapMonth` | bool | Meaningful only when `calendarType == lunar` |
| `direction` | enum | `countdown` \| `countup` |
| `precision` | enum | `day` \| `hour` \| `minute` \| `second` \| `millisecond` |
| `repeatRule` | enum | `none` \| `weekly` \| `monthly` \| `yearly` \| `lunarYearly` |
| `repeatInterval` | int | ≥ 1 |
| `colorValue` | int | ARGB (32-bit) |
| `icon` | string | Emoji |
| `pinned` | bool | |
| `sortOrder` | int | Manual ordering |
| `reminders` | Reminder[] | Nested, replaced wholesale on write |
| `createdAtMs` / `updatedAtMs` | int | Epoch ms UTC |
| `deleted` | bool | **Tombstone** — propagates deletes through sync |

### Reminder  (`ReminderDto`)

```json
{ "id": "uuid", "enabled": true, "offsetDays": 1, "offsetHours": 0, "offsetMinutes": 0, "soundId": "default" }
```

Fires `offsetDays*24h + offsetHours + offsetMinutes` **before** the event. All
zero ⇒ at the event moment. `notifId` (the OS notification id) is a local-only
concern and is deliberately **not** on the wire.

### User  (`UserDto`)

```json
{ "id": "uuid", "displayName": "Jane", "email": "jane@example.com", "avatarUrl": null, "provider": "apple" }
```

### Auth tokens  (`AuthTokensDto`)

```json
{ "accessToken": "jwt…", "refreshToken": "opaque…", "expiresInMs": 3600000 }
```

---

## 3. Authentication

Sign-in exchanges a provider-issued identity token for app tokens. Supported
providers: `apple`, `google` (WeChat `wechat` reserved for a later phase).

### `POST /v1/auth/{provider}`

Request:

```json
{ "idToken": "<provider id_token or auth code>" }
```

Response `200` → `AuthResponseDto`:

```json
{ "user": { /* UserDto */ }, "tokens": { /* AuthTokensDto */ } }
```

The server verifies `idToken` with Apple/Google, upserts the user, and issues an
app JWT `accessToken` + rotating `refreshToken`.

### `POST /v1/auth/refresh`

Request `{ "refreshToken": "…" }` → `200` `AuthTokensDto` (rotates the refresh
token). A `401` means the session is dead → sign in again.

### `GET /v1/me`

Auth required → `200` `UserDto`.

### `DELETE /v1/me`

Auth required. Permanently deletes the account and all server-side data
(required by Apple's guidelines). → `204`.

---

## 4. Sync

Offline-first delta sync. The local SQLite DB is the source of truth; the server
is a mergeable replica keyed by countdown `id`.

### `POST /v1/sync`

Auth required. Push local changes and pull server changes in one round-trip.

Request:

```json
{
  "sinceMs": 1710000000000,          // null on first sync
  "changes": [ /* CountdownDto[] incl. tombstones */ ]
}
```

Response `200` → `SyncResponseDto`:

```json
{
  "serverTimeMs": 1710000012345,     // new watermark to persist as next `sinceMs`
  "changes": [ /* CountdownDto[] changed on the server since `sinceMs` */ ]
}
```

Server algorithm:

1. For each incoming record, apply **last-write-wins** by `updatedAtMs` (ties →
   keep server copy). Tombstones (`deleted: true`) mark the row deleted.
2. Return every record whose `updatedAtMs > sinceMs` (including tombstones), plus
   a fresh `serverTimeMs` watermark.

Client then applies each returned record locally with the same LWW rule (see
`SyncService.synchronize` + `resolveLastWriteWins`).

> Single-record REST variants may also be exposed for convenience but are not
> required by the client: `POST /v1/countdowns`, `PUT /v1/countdowns/{id}`
> (optimistic-concurrency via `If-Unmodified-Since`/`updatedAtMs`, `409` on
> stale), `DELETE /v1/countdowns/{id}` (soft delete), `GET /v1/countdowns?updatedSince=`.

---

## 5. Share & QR import

Lets a user share a countdown and lets others import it by scanning a QR (which
encodes the `url` / a `cdapp://import?code=<code>` deep link).

### `POST /v1/shares`

Auth required. Body is **either** an owned countdown id **or** an inline
snapshot:

```json
{ "countdownId": "uuid" }
// or
{ "snapshot": { /* CountdownDto */ } }
```

Response `200` → `CreateShareResponseDto`:

```json
{ "code": "SH12ab", "url": "https://cd.example.com/s/SH12ab", "expiresAtMs": 1712600000000 }
```

### `GET /v1/shares/{code}`

**Public** (no auth) — used to resolve a scanned QR. → `200` `ShareDto`:

```json
{ "code": "SH12ab", "url": "https://…", "expiresAtMs": 1712600000000, "snapshot": { /* CountdownDto */ } }
```

`410 share_expired` once past `expiresAtMs`.

### `POST /v1/shares/{code}/import`

Auth required. Clones the shared countdown into the caller's account, assigning a
fresh `id`. → `200` `CountdownDto` (the imported copy).

---

## 6. Conflict resolution & tombstones

- **Identity**: countdown `id` is a client UUID and is stable across devices.
- **LWW**: the record with the greater `updatedAtMs` wins; ties resolve to the
  server. Every mutation must bump `updatedAtMs`.
- **Deletes**: never hard-delete across sync — set `deleted: true` and keep the
  row as a tombstone so the delete propagates. The client hard-deletes locally
  when it pulls a tombstone (`CountdownRepository.applyRemote`). Servers may
  garbage-collect tombstones older than, e.g., 90 days.
- **Reminders** sync nested inside their countdown and are replaced wholesale on
  each write (no independent reminder identity across the wire beyond `id`).

---

## 7. Devices / push  (reserved)

For future server-driven reminders:

### `POST /v1/devices`

```json
{ "platform": "ios" | "android", "token": "<APNs/FCM token>" }
```

Registers a push token for the authenticated user. Not used in the current
client (reminders are scheduled locally via `flutter_local_notifications`).
