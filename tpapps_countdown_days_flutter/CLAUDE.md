# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

An iOS-styled **countdown / count-up days** app (倒数日). Phase 1 (offline-complete)
is implemented: Cupertino UI on all platforms, create/edit/list/detail of countdowns,
millisecond-precision live countdown, Chinese lunar calendar (农历), zh/en localization,
local reminder notifications with selectable sounds, share-as-image, and JSON backup export.
Cloud sync, Apple/Google sign-in, home-screen widgets, and QR share/import are **architected
behind interfaces but not wired to the UI yet** (later phases). Toolchain: Flutter 3.44 / Dart 3.12.

## Commands

```bash
flutter pub get
flutter run -d <chrome|windows|macos|android|ios>   # desktop/web work; notifications no-op off-mobile
flutter analyze                                      # must be clean before done
dart format .
flutter test                                         # full suite
flutter test test/core/precision_formatter_test.dart # single file
flutter test --plain-name "round-trip"               # by name

# Code generation (freezed / json_serializable / drift / riverpod). Re-run after
# changing any annotated model, DB table, DTO, or @riverpod provider:
dart run build_runner build            # --delete-conflicting-outputs is now the default

# Localization: regenerate after editing lib/l10n/*.arb
flutter gen-l10n
```

Generated files (`*.g.dart`, `*.freezed.dart`, `lib/l10n/generated/`) are excluded from
analysis and must not be hand-edited.

## Architecture

Feature-first + layered. **Local SQLite (Drift) is the source of truth; all reads are reactive
`Stream`s surfaced through Riverpod.** Dependency direction: `features` → `repositories` →
(`local` | `remote`); `domain` depends on nothing.

- `lib/domain/` — freezed models (`Countdown`, `Reminder`, `Category`, `AppSettings`) + `enums.dart`.
  **Enum `index`es are persisted by Drift — only append, never reorder** (see the note in `enums.dart`).
- `lib/data/local/` — Drift `AppDatabase`. Timestamps stored as **epoch-ms ints** (not Drift's
  second-granularity DateTime) to preserve millisecond precision; enums via `intEnum`. Row classes
  are renamed with `@DataClassName` (`CountdownRow`…) to avoid clashing with domain models.
- `lib/data/repositories/` — `CountdownRepository` (reactive CRUD; **soft-delete** tombstones for
  future sync), `SettingsRepository`, `AuthRepository` (interface + Phase-1 stub), `SyncService`
  (delta sync, wired only in tests via `FakeRemoteApi`).
- `lib/data/remote/` — the documented REST client: DTOs (`dto/`), `RemoteApi` interface,
  `DioRemoteApi` (live), `FakeRemoteApi` (in-memory), `mappers.dart`, and the pure
  `resolveLastWriteWins`. The contract is fully specified in **`docs/backend-api.md`**.
- `lib/core/` — `time/precision_formatter.dart` (live countdown formatting), `time/recurrence.dart`
  (`effectiveTarget`/`nextOccurrenceAfter` incl. solar + lunar-yearly roll-forward),
  `lunar/lunar_service.dart` (农历 conversion via the `lunar` package).
- `lib/features/` — `countdown_list` (grouped/search/sort/swipe-delete), `countdown_detail`
  (live ticking + lunar + share card), `countdown_edit`, `settings`.
- `lib/services/` — `NotificationService` (flutter_local_notifications; **guards every call so it
  no-ops on web/Windows** and never throws), `share_card_service`, `backup_service`.
- `lib/providers/` — `@riverpod` code-gen providers (db, repos, settings, ticker, services).
- `lib/app/` — `CupertinoApp.router` root, theme, go_router routes.

Bootstrapping: `main.dart` loads `SharedPreferences` and inits notifications **before** `runApp`,
then injects both via `ProviderScope` overrides (`sharedPreferencesProvider`,
`notificationServiceProvider`). Settings are read synchronously so the first frame has the right
locale/theme.

## Conventions & gotchas

- **Riverpod 3.x**: `AsyncValue.value` is the nullable accessor (`valueOrNull` was removed).
- **freezed 3.x**: data classes are declared `abstract class X with _$X`.
- **Widget tests**: never `pumpAndSettle()` when the loading-state `CupertinoActivityIndicator` can
  be on screen (it animates forever → the frame queue never drains). Use bounded `pump(Duration)`.
  See `test/app/smoke_test.dart`, which overrides `countdownListProvider` with a closed `Stream` to
  avoid a lingering Drift query timer.
- Notification sounds beyond `default` expect assets to be added (`android/app/src/main/res/raw/<id>`
  + iOS bundle `<id>.caf`); until then the OS falls back to the default sound. Android manifest
  already declares the notification permissions + boot receiver.
- iOS look on every platform: use Cupertino widgets; a null theme `brightness` follows the system.
