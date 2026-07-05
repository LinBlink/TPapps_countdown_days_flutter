import 'package:drift/drift.dart';

import '../../domain/enums.dart';
import '../../domain/models/countdown.dart';
import '../../domain/models/reminder.dart';
import '../local/database.dart';

/// Offline-first data access for countdowns. Local SQLite is the source of
/// truth; all reads are reactive `Stream`s so the UI updates automatically.
///
/// Deletes are *soft* (row kept, `deleted`/`syncState` flagged) so that cloud
/// sync can later propagate the tombstone; reads always filter them out.
class CountdownRepository {
  CountdownRepository(this._db);

  final AppDatabase _db;

  Stream<List<Countdown>> watchAll() {
    final query = _db.select(_db.countdowns).join([
      leftOuterJoin(
        _db.reminders,
        _db.reminders.countdownId.equalsExp(_db.countdowns.id),
      ),
    ])
      ..where(_db.countdowns.deleted.equals(false));
    return query.watch().map(_group);
  }

  Stream<Countdown?> watchById(String id) {
    final query = _db.select(_db.countdowns).join([
      leftOuterJoin(
        _db.reminders,
        _db.reminders.countdownId.equalsExp(_db.countdowns.id),
      ),
    ])
      ..where(_db.countdowns.id.equals(id) &
          _db.countdowns.deleted.equals(false));
    return query.watch().map((rows) {
      final grouped = _group(rows);
      return grouped.isEmpty ? null : grouped.first;
    });
  }

  /// Collapses the flat `countdown × reminder` join into nested domain objects,
  /// preserving the query's row order.
  List<Countdown> _group(List<TypedResult> rows) {
    final order = <String>[];
    final byId = <String, CountdownRow>{};
    final remindersById = <String, List<ReminderRow>>{};
    for (final row in rows) {
      final cd = row.readTable(_db.countdowns);
      if (!byId.containsKey(cd.id)) {
        byId[cd.id] = cd;
        order.add(cd.id);
        remindersById[cd.id] = <ReminderRow>[];
      }
      final rem = row.readTableOrNull(_db.reminders);
      if (rem != null) remindersById[cd.id]!.add(rem);
    }
    return [for (final id in order) _toDomain(byId[id]!, remindersById[id]!)];
  }

  Future<Countdown?> getById(String id) async {
    final row = await (_db.select(_db.countdowns)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (row == null || row.deleted) return null;
    final rems = await (_db.select(_db.reminders)
          ..where((r) => r.countdownId.equals(id)))
        .get();
    return _toDomain(row, rems);
  }

  Future<List<Countdown>> getAll() async {
    final stream = watchAll();
    return stream.first;
  }

  /// Insert or replace a countdown together with its reminder set.
  Future<void> upsert(Countdown c) async {
    await _db.transaction(() async {
      await _db.into(_db.countdowns).insertOnConflictUpdate(_toRow(c));
      await (_db.delete(_db.reminders)
            ..where((r) => r.countdownId.equals(c.id)))
          .go();
      for (final r in c.reminders) {
        await _db.into(_db.reminders).insert(_toReminderRow(r));
      }
    });
  }

  /// Soft-delete: keeps the row as a tombstone for future sync.
  Future<void> softDelete(String id) async {
    await _db.transaction(() async {
      await (_db.delete(_db.reminders)..where((r) => r.countdownId.equals(id)))
          .go();
      await (_db.update(_db.countdowns)..where((t) => t.id.equals(id))).write(
        CountdownsCompanion(
          deleted: const Value(true),
          syncState: const Value(SyncState.pendingDelete),
          updatedAtMs: Value(DateTime.now().millisecondsSinceEpoch),
        ),
      );
    });
  }

  /// Replace the entire local dataset (used by backup import).
  Future<void> replaceAll(List<Countdown> items) async {
    await _db.transaction(() async {
      await _db.delete(_db.reminders).go();
      await _db.delete(_db.countdowns).go();
      for (final c in items) {
        await _db.into(_db.countdowns).insert(_toRow(c));
        for (final r in c.reminders) {
          await _db.into(_db.reminders).insert(_toReminderRow(r));
        }
      }
    });
  }
}

// ---------------------------------------------------------------------------
// Row <-> domain mapping
// ---------------------------------------------------------------------------

Countdown _toDomain(CountdownRow row, List<ReminderRow> reminders) {
  return Countdown(
    id: row.id,
    title: row.title,
    note: row.note,
    target: DateTime.fromMillisecondsSinceEpoch(row.targetMs),
    allDay: row.allDay,
    calendarType: row.calendarType,
    lunarLeapMonth: row.lunarLeapMonth,
    direction: row.direction,
    precision: row.precision,
    repeatRule: row.repeatRule,
    repeatInterval: row.repeatInterval,
    categoryId: row.categoryId,
    colorValue: row.colorValue,
    icon: row.icon,
    coverPath: row.coverPath,
    pinned: row.pinned,
    sortOrder: row.sortOrder,
    reminders: [for (final r in reminders) _toReminderDomain(r)],
    createdAt: DateTime.fromMillisecondsSinceEpoch(row.createdAtMs),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(row.updatedAtMs),
    remoteId: row.remoteId,
    syncState: row.syncState,
    deleted: row.deleted,
  );
}

Reminder _toReminderDomain(ReminderRow r) => Reminder(
      id: r.id,
      countdownId: r.countdownId,
      enabled: r.enabled,
      offsetDays: r.offsetDays,
      offsetHours: r.offsetHours,
      offsetMinutes: r.offsetMinutes,
      soundId: r.soundId,
      notifId: r.notifId,
      createdAt: DateTime.fromMillisecondsSinceEpoch(r.createdAtMs),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(r.updatedAtMs),
    );

CountdownsCompanion _toRow(Countdown c) => CountdownsCompanion(
      id: Value(c.id),
      title: Value(c.title),
      note: Value(c.note),
      targetMs: Value(c.target.millisecondsSinceEpoch),
      allDay: Value(c.allDay),
      calendarType: Value(c.calendarType),
      lunarLeapMonth: Value(c.lunarLeapMonth),
      direction: Value(c.direction),
      precision: Value(c.precision),
      repeatRule: Value(c.repeatRule),
      repeatInterval: Value(c.repeatInterval),
      categoryId: Value(c.categoryId),
      colorValue: Value(c.colorValue),
      icon: Value(c.icon),
      coverPath: Value(c.coverPath),
      pinned: Value(c.pinned),
      sortOrder: Value(c.sortOrder),
      createdAtMs: Value(c.createdAt.millisecondsSinceEpoch),
      updatedAtMs: Value(c.updatedAt.millisecondsSinceEpoch),
      remoteId: Value(c.remoteId),
      syncState: Value(c.syncState),
      deleted: Value(c.deleted),
    );

RemindersCompanion _toReminderRow(Reminder r) => RemindersCompanion(
      id: Value(r.id),
      countdownId: Value(r.countdownId),
      enabled: Value(r.enabled),
      offsetDays: Value(r.offsetDays),
      offsetHours: Value(r.offsetHours),
      offsetMinutes: Value(r.offsetMinutes),
      soundId: Value(r.soundId),
      notifId: Value(r.notifId),
      createdAtMs: Value(r.createdAt.millisecondsSinceEpoch),
      updatedAtMs: Value(r.updatedAt.millisecondsSinceEpoch),
    );
