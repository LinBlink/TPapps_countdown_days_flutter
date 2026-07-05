import '../../domain/enums.dart';

/// The absolute remaining/elapsed time split into calendar-ish components.
class CountdownParts {
  const CountdownParts({
    required this.isPast,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.milliseconds,
  });

  /// Splits a *signed* duration (target − now). Negative ⇒ the event is past.
  factory CountdownParts.of(Duration signed) {
    final d = signed.abs();
    return CountdownParts(
      isPast: signed.isNegative,
      days: d.inDays,
      hours: d.inHours % 24,
      minutes: d.inMinutes % 60,
      seconds: d.inSeconds % 60,
      milliseconds: d.inMilliseconds % 1000,
    );
  }

  final bool isPast;
  final int days, hours, minutes, seconds, milliseconds;
}

/// Localized short unit labels (d/h/m/s/ms ↔ 天/时/分/秒/毫秒).
class PrecisionLabels {
  const PrecisionLabels({
    required this.day,
    required this.hour,
    required this.minute,
    required this.second,
    required this.millisecond,
  });

  final String day, hour, minute, second, millisecond;
}

/// Formats [signed] down to [precision], e.g. `3天 5时 22分` or `3d 5h 22m`.
/// Components finer than [precision] are dropped; days are always shown.
String formatCountdown(
  Duration signed,
  Precision precision,
  PrecisionLabels labels,
) {
  final p = CountdownParts.of(signed);
  bool include(Precision unit) => precision.index >= unit.index;

  final tokens = <String>['${p.days}${labels.day}'];
  if (include(Precision.hour)) tokens.add('${p.hours}${labels.hour}');
  if (include(Precision.minute)) tokens.add('${p.minutes}${labels.minute}');
  if (include(Precision.second)) tokens.add('${p.seconds}${labels.second}');
  if (include(Precision.millisecond)) {
    tokens.add('${p.milliseconds.toString().padLeft(3, '0')}${labels.millisecond}');
  }
  return tokens.join(' ');
}
