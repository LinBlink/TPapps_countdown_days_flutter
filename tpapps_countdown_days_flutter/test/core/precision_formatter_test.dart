import 'package:flutter_test/flutter_test.dart';
import 'package:tpapps_countdown_days_flutter/core/time/precision_formatter.dart';
import 'package:tpapps_countdown_days_flutter/domain/enums.dart';

const _labels = PrecisionLabels(
  day: 'd',
  hour: 'h',
  minute: 'm',
  second: 's',
  millisecond: 'ms',
);

void main() {
  group('CountdownParts', () {
    test('splits a positive duration into components', () {
      final p = CountdownParts.of(
        const Duration(days: 3, hours: 5, minutes: 22, seconds: 47, milliseconds: 678),
      );
      expect(p.isPast, isFalse);
      expect(p.days, 3);
      expect(p.hours, 5);
      expect(p.minutes, 22);
      expect(p.seconds, 47);
      expect(p.milliseconds, 678);
    });

    test('flags negative durations as past and uses absolute components', () {
      final p = CountdownParts.of(const Duration(hours: -25));
      expect(p.isPast, isTrue);
      expect(p.days, 1);
      expect(p.hours, 1);
    });
  });

  group('formatCountdown', () {
    final d = const Duration(
      days: 3,
      hours: 5,
      minutes: 22,
      seconds: 47,
      milliseconds: 8,
    );

    test('day precision shows only days', () {
      expect(formatCountdown(d, Precision.day, _labels), '3d');
    });

    test('minute precision shows d/h/m', () {
      expect(formatCountdown(d, Precision.minute, _labels), '3d 5h 22m');
    });

    test('millisecond precision zero-pads ms to 3 digits', () {
      expect(
        formatCountdown(d, Precision.millisecond, _labels),
        '3d 5h 22m 47s 008ms',
      );
    });
  });
}
