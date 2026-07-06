import 'dto/api_dto.dart';
import 'dto/countdown_dto.dart';

/// Typed client for the countdown backend. See `docs/backend-api.md` for the
/// full REST contract each method maps to. Implemented by [DioRemoteApi] (live)
/// and `FakeRemoteApi` (in-memory, for tests / local dev).
abstract interface class RemoteApi {
  /// `POST /v1/auth/{provider}` — exchange a provider id-token for app tokens.
  Future<AuthResponseDto> authenticate({
    required String provider,
    required String idToken,
  });

  /// `POST /v1/auth/refresh`.
  Future<AuthTokensDto> refresh(String refreshToken);

  /// `GET /v1/me`.
  Future<UserDto> me(String accessToken);

  /// `POST /v1/sync` — push local [changes] and pull everything changed on the
  /// server since [sinceMs] (null on first sync).
  Future<SyncResponseDto> sync({
    required String accessToken,
    required int? sinceMs,
    required List<CountdownDto> changes,
  });

  /// `POST /v1/shares` — create a share from an owned countdown or an inline
  /// [snapshot]; returns the share code + URL for a QR.
  Future<CreateShareResponseDto> createShare({
    required String accessToken,
    String? countdownId,
    CountdownDto? snapshot,
  });

  /// `GET /v1/shares/{code}` — public resolution of a share (for QR import).
  Future<ShareDto> resolveShare(String code);

  /// `POST /v1/shares/{code}/import` — clone a shared countdown into my account.
  Future<CountdownDto> importShare({
    required String accessToken,
    required String code,
  });
}

/// Pure last-write-wins merge used during sync: for each id, the record with
/// the greater `updatedAtMs` wins (ties resolve to the remote copy so the
/// server stays authoritative). Tombstones (`deleted: true`) participate like
/// any other change. Extracted as a pure function so it is trivially testable.
List<CountdownDto> resolveLastWriteWins(
  List<CountdownDto> local,
  List<CountdownDto> remote,
) {
  final byId = <String, CountdownDto>{};
  for (final c in local) {
    byId[c.id] = c;
  }
  for (final r in remote) {
    final existing = byId[r.id];
    if (existing == null || r.updatedAtMs >= existing.updatedAtMs) {
      byId[r.id] = r;
    }
  }
  return byId.values.toList();
}
