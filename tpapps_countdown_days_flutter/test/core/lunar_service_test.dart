import 'package:flutter_test/flutter_test.dart';
import 'package:tpapps_countdown_days_flutter/core/lunar/lunar_service.dart';

void main() {
  group('lunarInfoOf', () {
    test('Chinese New Year 2024 (2024-02-10) is 正月初一', () {
      final li = lunarInfoOf(DateTime(2024, 2, 10));
      expect(li.monthDay, '正月初一');
    });

    test('produces non-empty month/day/zodiac text', () {
      final li = lunarInfoOf(DateTime(2026, 8, 28));
      expect(li.monthText, isNotEmpty);
      expect(li.dayText, isNotEmpty);
      expect(li.zodiac, isNotEmpty);
    });
  });

  group('solar <-> lunar round-trip', () {
    final dates = [
      DateTime(2026, 1, 1),
      DateTime(2026, 2, 17),
      DateTime(2025, 10, 6),
      DateTime(2024, 2, 10),
      DateTime(2026, 8, 28),
    ];

    for (final date in dates) {
      test('round-trips ${date.toIso8601String().split('T').first}', () {
        final li = lunarInfoOf(date);
        final signed = li.isLeapMonth ? -li.month : li.month;
        final back = lunarToSolar(li.year, signed, li.day, date);
        expect(back, isNotNull);
        expect(
          DateTime(back!.year, back.month, back.day),
          DateTime(date.year, date.month, date.day),
        );
      });
    }
  });
}
