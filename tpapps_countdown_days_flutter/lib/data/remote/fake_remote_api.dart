import 'dto/api_dto.dart';
import 'dto/countdown_dto.dart';
import 'remote_api.dart';

/// In-memory [RemoteApi] for tests and local development.
///
/// `sync` applies incoming changes with last-write-wins and echoes back every
/// record whose `updatedAtMs` exceeds the client's watermark, so the store's
/// own timestamps double as the delta cursor.
class FakeRemoteApi implements RemoteApi {
  final Map<String, CountdownDto> store = {};
  final Map<String, ShareDto> _shares = {};
  int _shareSeq = 0;

  @override
  Future<AuthResponseDto> authenticate({
    required String provider,
    required String idToken,
  }) async {
    return AuthResponseDto(
      user: UserDto(
        id: 'user-$provider',
        displayName: 'Test $provider',
        provider: provider,
      ),
      tokens: AuthTokensDto(
        accessToken: 'access-token',
        refreshToken: 'refresh-token',
        expiresInMs: 3600000,
      ),
    );
  }

  @override
  Future<AuthTokensDto> refresh(String refreshToken) async => AuthTokensDto(
    accessToken: 'access-token-2',
    refreshToken: refreshToken,
    expiresInMs: 3600000,
  );

  @override
  Future<UserDto> me(String accessToken) async =>
      UserDto(id: 'user', displayName: 'Test', provider: 'apple');

  @override
  Future<SyncResponseDto> sync({
    required String accessToken,
    required int? sinceMs,
    required List<CountdownDto> changes,
  }) async {
    for (final c in changes) {
      final existing = store[c.id];
      if (existing == null || c.updatedAtMs >= existing.updatedAtMs) {
        store[c.id] = c;
      }
    }
    final since = sinceMs ?? -1;
    final serverChanges = [
      for (final c in store.values)
        if (c.updatedAtMs > since) c,
    ];
    final serverTime = store.values.fold<int>(
      sinceMs ?? 0,
      (m, c) => c.updatedAtMs > m ? c.updatedAtMs : m,
    );
    return SyncResponseDto(serverTimeMs: serverTime, changes: serverChanges);
  }

  @override
  Future<CreateShareResponseDto> createShare({
    required String accessToken,
    String? countdownId,
    CountdownDto? snapshot,
  }) async {
    final snap = snapshot ?? store[countdownId];
    if (snap == null) throw StateError('nothing to share');
    final code = 'SH${++_shareSeq}';
    final url = 'https://cd.example.com/s/$code';
    const expires = 9999999999999;
    _shares[code] = ShareDto(
      code: code,
      url: url,
      expiresAtMs: expires,
      snapshot: snap,
    );
    return CreateShareResponseDto(code: code, url: url, expiresAtMs: expires);
  }

  @override
  Future<ShareDto> resolveShare(String code) async {
    final s = _shares[code];
    if (s == null) throw StateError('unknown share code');
    return s;
  }

  @override
  Future<CountdownDto> importShare({
    required String accessToken,
    required String code,
  }) async {
    final s = await resolveShare(code);
    return s.snapshot;
  }
}
