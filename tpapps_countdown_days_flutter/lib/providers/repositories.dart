import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/local/database.dart';
import '../data/repositories/countdown_repository.dart';
import '../domain/models/countdown.dart';

part 'repositories.g.dart';

/// The single app-wide Drift database instance.
@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}

@Riverpod(keepAlive: true)
CountdownRepository countdownRepository(Ref ref) =>
    CountdownRepository(ref.watch(appDatabaseProvider));

/// Reactive stream of all (non-deleted) countdowns.
@riverpod
Stream<List<Countdown>> countdownList(Ref ref) =>
    ref.watch(countdownRepositoryProvider).watchAll();

/// Reactive stream of a single countdown by id (null once deleted/missing).
@riverpod
Stream<Countdown?> countdownById(Ref ref, String id) =>
    ref.watch(countdownRepositoryProvider).watchById(id);
