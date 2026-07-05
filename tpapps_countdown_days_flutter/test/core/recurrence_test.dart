import 'package:flutter_test/flutter_test.dart';
import 'package:tpapps_countdown_days_flutter/core/lunar/lunar_service.dart';
import 'package:tpapps_countdown_days_flutter/core/time/recurrence.dart';
import 'package:tpapps_countdown_days_flutter/domain/enums.dart';
import 'package:tpapps_countdown_days_flutter/domain/models/countdown.dart';

Countdown _c({
  required DateTime target,
  RepeatRule rule = RepeatRule.none,
  int interval = 1,
}) {
  final now = DateTime(2020);
  return Countdown(
    id: 'x',
    title: 't',
    target: target,
    repeatRule: rule,
    repeatInterval: interval,
    createdAt: now,
    updatedAt: now,
  );
}

void main() {
  group('addMonthsClamped', () {
    test('clamps Jan 31 + 1 month to end of February', () {
      expect(addMonthsClamped(DateTime(2026, 1, 31), 1), DateTime(2026, 2, 28));
    });
    test('preserves time-of-day and rolls the year', () {
      expect(
        addMonthsClamped(DateTime(2026, 11, 15, 9, 30), 2),
        DateTime(2027, 1, 15, 9, 30),
      );
    });
  });

  group('nextOccurrenceAfter (solar)', () {
    test('non-repeating returns the original target', () {
      final t = DateTime(2026, 5, 1);
      expect(nextOccurrenceAfter(_c(target: t), DateTime(2030)), t);
    });

    test('weekly honours the interval', () {
      final next = nextOccurrenceAfter(
        _c(target: DateTime(2026, 1, 1), rule: RepeatRule.weekly, interval: 2),
        DateTime(2026, 1, 5),
      );
      expect(next, DateTime(2026, 1, 15));
    });

    test('yearly on Feb 29 clamps to Feb 28 in a non-leap year', () {
      final next = nextOccurrenceAfter(
        _c(target: DateTime(2024, 2, 29), rule: RepeatRule.yearly),
        DateTime(2024, 3, 1),
      );
      expect(next, DateTime(2025, 2, 28));
    });

    test('always returns a moment strictly after `after`', () {
      final next = nextOccurrenceAfter(
        _c(target: DateTime(2026, 6, 1), rule: RepeatRule.monthly),
        DateTime(2026, 9, 10),
      );
      expect(next.isAfter(DateTime(2026, 9, 10)), isTrue);
    });
  });

  group('nextLunarYearly', () {
    test('lands on the same lunar month/day, strictly later', () {
      final target = DateTime(2025, 10, 6, 20); // some lunar date
      final baseLunar = lunarInfoOf(target);
      final next = nextLunarYearly(target, target);

      expect(next.isAfter(target), isTrue);
      final nextLunar = lunarInfoOf(next);
      expect(nextLunar.month, baseLunar.month);
      expect(nextLunar.day, baseLunar.day);
      expect(nextLunar.isLeapMonth, baseLunar.isLeapMonth);
    });
  });
}
