import '../remote/mappers.dart';
import '../remote/remote_api.dart';
import 'countdown_repository.dart';

/// Orchestrates one delta-sync round-trip: push every local change (including
/// tombstones), pull everything changed on the server since [sinceMs], and
/// apply the pulled records locally. Last-write-wins conflict resolution lives
/// server-side (and in [resolveLastWriteWins]); this just wires local ⇄ remote.
///
/// Not connected to the UI in Phase 1 — exercised by tests via `FakeRemoteApi`.
class SyncService {
  SyncService({required this.api, required this.repository});

  final RemoteApi api;
  final CountdownRepository repository;

  /// Returns the new server watermark to persist for the next sync.
  Future<int> synchronize({required String accessToken, int? sinceMs}) async {
    final local = await repository.getAllForSync();
    final response = await api.sync(
      accessToken: accessToken,
      sinceMs: sinceMs,
      changes: [for (final c in local) countdownToDto(c)],
    );
    for (final dto in response.changes) {
      await repository.applyRemote(countdownFromDto(dto));
    }
    return response.serverTimeMs;
  }
}
