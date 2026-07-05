import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../domain/enums.dart';

part 'database.g.dart';

/// Timestamps are stored as **epoch milliseconds** (int) rather than Drift's
/// default second-granularity DateTime so that millisecond precision survives a
/// round-trip. Enums are stored by their `index` via `intEnum` — see the
/// reorder warning in `domain/enums.dart`.
///
/// The generated row data classes are renamed with `@DataClassName` so they do
/// not collide with the domain models of the same concept.
@DataClassName('CountdownRow')
class Countdowns extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get note => text().nullable()();
  IntColumn get targetMs => integer()();
  TextColumn get tzName => text().withDefault(const Constant('local'))();
  BoolColumn get allDay => boolean().withDefault(const Constant(true))();
  IntColumn get calendarType => intEnum<CalendarType>()();
  BoolColumn get lunarLeapMonth =>
      boolean().withDefault(const Constant(false))();
  IntColumn get direction => intEnum<Direction>()();
  IntColumn get precision => intEnum<Precision>()();
  IntColumn get repeatRule => intEnum<RepeatRule>()();
  IntColumn get repeatInterval => integer().withDefault(const Constant(1))();
  TextColumn get categoryId => text().nullable()();
  IntColumn get colorValue =>
      integer().withDefault(const Constant(0xFF0A84FF))();
  TextColumn get icon => text().withDefault(const Constant('📅'))();
  TextColumn get coverPath => text().nullable()();
  BoolColumn get pinned => boolean().withDefault(const Constant(false))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  IntColumn get createdAtMs => integer()();
  IntColumn get updatedAtMs => integer()();
  // Reserved for cloud sync (Phase 2).
  TextColumn get remoteId => text().nullable()();
  IntColumn get syncState => intEnum<SyncState>()
      .withDefault(Constant(SyncState.localOnly.index))();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('ReminderRow')
class Reminders extends Table {
  TextColumn get id => text()();
  TextColumn get countdownId =>
      text().references(Countdowns, #id, onDelete: KeyAction.cascade)();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
  IntColumn get offsetDays => integer().withDefault(const Constant(0))();
  IntColumn get offsetHours => integer().withDefault(const Constant(0))();
  IntColumn get offsetMinutes => integer().withDefault(const Constant(0))();
  TextColumn get soundId => text().withDefault(const Constant('default'))();
  IntColumn get notifId => integer()();
  IntColumn get createdAtMs => integer()();
  IntColumn get updatedAtMs => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DataClassName('CategoryRow')
class Categories extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get colorValue =>
      integer().withDefault(const Constant(0xFF8E8E93))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(tables: [Countdowns, Reminders, Categories])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'countdowns.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
