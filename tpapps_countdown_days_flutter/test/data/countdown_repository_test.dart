import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpapps_countdown_days_flutter/data/local/database.dart';
import 'package:tpapps_countdown_days_flutter/data/repositories/countdown_repository.dart';
import 'package:tpapps_countdown_days_flutter/domain/models/countdown.dart';
import 'package:tpapps_countdown_days_flutter/domain/models/reminder.dart';

void main() {
  late AppDatabase db;
  late CountdownRepository repo;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repo = CountdownRepository(db);
  });
  tearDown(() => db.close());

  Countdown sample(String id, {DateTime? target}) {
    final now = DateTime(2026);
    return Countdown(
      id: id,
      title: 'Event $id',
      target: target ?? DateTime(2026, 12, 31, 23, 59),
      createdAt: now,
      updatedAt: now,
      reminders: [
        Reminder(
          id: '$id-r1',
          countdownId: id,
          offsetDays: 1,
          notifId: 1,
          createdAt: now,
          updatedAt: now,
        ),
      ],
    );
  }

  test('upsert then watchAll emits the countdown with its reminders', () async {
    await repo.upsert(sample('a'));
    final list = await repo.watchAll().first;
    expect(list, hasLength(1));
    expect(list.first.title, 'Event a');
    expect(list.first.reminders, hasLength(1));
    expect(list.first.reminders.first.offsetDays, 1);
  });

  test('upsert replaces the reminder set instead of duplicating', () async {
    await repo.upsert(sample('a'));
    await repo.upsert(sample('a')); // same single reminder
    final got = await repo.getById('a');
    expect(got!.reminders, hasLength(1));
  });

  test('getById returns null after softDelete', () async {
    await repo.upsert(sample('b'));
    expect(await repo.getById('b'), isNotNull);
    await repo.softDelete('b');
    expect(await repo.getById('b'), isNull);
    expect(await repo.watchAll().first, isEmpty);
  });

  test('replaceAll swaps the whole dataset', () async {
    await repo.upsert(sample('c'));
    await repo.replaceAll([sample('d'), sample('e')]);
    final list = await repo.watchAll().first;
    expect(list.map((c) => c.id), containsAll(['d', 'e']));
    expect(list.any((c) => c.id == 'c'), isFalse);
  });

  test('millisecond precision survives a round-trip', () async {
    final target = DateTime.fromMillisecondsSinceEpoch(1893456789123);
    await repo.upsert(sample('f', target: target));
    final got = await repo.getById('f');
    expect(got!.target.millisecondsSinceEpoch, target.millisecondsSinceEpoch);
  });
}
