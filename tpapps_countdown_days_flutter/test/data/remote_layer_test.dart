import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tpapps_countdown_days_flutter/data/local/database.dart';
import 'package:tpapps_countdown_days_flutter/data/remote/dto/countdown_dto.dart';
import 'package:tpapps_countdown_days_flutter/data/remote/fake_remote_api.dart';
import 'package:tpapps_countdown_days_flutter/data/remote/mappers.dart';
import 'package:tpapps_countdown_days_flutter/data/remote/remote_api.dart';
import 'package:tpapps_countdown_days_flutter/data/repositories/countdown_repository.dart';
import 'package:tpapps_countdown_days_flutter/data/repositories/sync_service.dart';
import 'package:tpapps_countdown_days_flutter/domain/enums.dart';
import 'package:tpapps_countdown_days_flutter/domain/models/countdown.dart';

CountdownDto _dto(String id, {int updatedAtMs = 1000, bool deleted = false}) =>
    CountdownDto(
      id: id,
      title: 'Event $id',
      note: null,
      targetMs: 1893456000000,
      allDay: true,
      calendarType: CalendarType.solar,
      lunarLeapMonth: false,
      direction: Direction.countdown,
      precision: Precision.day,
      repeatRule: RepeatRule.none,
      repeatInterval: 1,
      colorValue: 0xFF0A84FF,
      icon: '📅',
      pinned: false,
      sortOrder: 0,
      reminders: [],
      createdAtMs: 500,
      updatedAtMs: updatedAtMs,
      deleted: deleted,
    );

Countdown _domain(String id) {
  final now = DateTime(2026);
  return Countdown(
    id: id,
    title: 'Local $id',
    target: DateTime(2026, 12, 31),
    createdAt: now,
    updatedAt: now,
  );
}

void main() {
  group('CountdownDto JSON', () {
    test('round-trips and serialises enums by name', () {
      final dto = _dto('a');
      final json = dto.toJson();
      expect(json['calendarType'], 'solar');
      expect(json['precision'], 'day');
      expect(json['targetMs'], isA<int>());

      final back = CountdownDto.fromJson(json);
      expect(back.id, dto.id);
      expect(back.calendarType, CalendarType.solar);
      expect(back.updatedAtMs, dto.updatedAtMs);
    });

    test('domain <-> dto mapping preserves the target instant', () {
      final domain = _domain('b');
      final back = countdownFromDto(countdownToDto(domain));
      expect(back.id, domain.id);
      expect(
        back.target.millisecondsSinceEpoch,
        domain.target.millisecondsSinceEpoch,
      );
      expect(back.syncState, SyncState.synced);
    });
  });

  group('resolveLastWriteWins', () {
    test('newer updatedAtMs wins; server wins ties', () {
      final merged = resolveLastWriteWins(
        [_dto('x', updatedAtMs: 100), _dto('y', updatedAtMs: 100)],
        [_dto('x', updatedAtMs: 200), _dto('y', updatedAtMs: 100)],
      );
      final byId = {for (final c in merged) c.id: c};
      expect(byId['x']!.updatedAtMs, 200); // remote newer
      expect(byId['y']!.updatedAtMs, 100); // tie -> remote
    });
  });

  group('FakeRemoteApi.sync', () {
    test('stores pushes and returns delta since watermark', () async {
      final api = FakeRemoteApi();
      final first = await api.sync(
        accessToken: 't',
        sinceMs: null,
        changes: [_dto('a', updatedAtMs: 100)],
      );
      expect(first.changes.map((c) => c.id), ['a']);
      expect(first.serverTimeMs, 100);

      // Nothing new since watermark 100.
      final second = await api.sync(
        accessToken: 't',
        sinceMs: 100,
        changes: [],
      );
      expect(second.changes, isEmpty);
    });
  });

  group('SyncService', () {
    late AppDatabase db;
    late CountdownRepository repo;

    setUp(() {
      db = AppDatabase(NativeDatabase.memory());
      repo = CountdownRepository(db);
    });
    tearDown(() => db.close());

    test('pushes local changes and applies server-only records', () async {
      final api = FakeRemoteApi();
      api.store['server1'] = _dto('server1', updatedAtMs: 5000);
      await repo.upsert(_domain('local1'));

      final sync = SyncService(api: api, repository: repo);
      await sync.synchronize(accessToken: 't', sinceMs: null);

      // Local record was pushed to the server.
      expect(api.store.containsKey('local1'), isTrue);
      // Server-only record was applied locally.
      final ids = (await repo.getAll()).map((c) => c.id).toSet();
      expect(ids, containsAll(['local1', 'server1']));
    });
  });
}
