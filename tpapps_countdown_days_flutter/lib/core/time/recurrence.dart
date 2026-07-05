import '../../domain/enums.dart';
import '../../domain/models/countdown.dart';
import '../lunar/lunar_service.dart';

/// Adds [months] to [d], clamping the day to the target month's length so that
/// e.g. Jan 31 + 1 month → Feb 28/29. Preserves the time-of-day.
DateTime addMonthsClamped(DateTime d, int months) {
  final total = d.month - 1 + months;
  final year = d.year + (total ~/ 12);
  final month = total % 12 + 1;
  final lastDay = DateTime(year, month + 1, 0).day;
  final day = d.day <= lastDay ? d.day : lastDay;
  return DateTime(year, month, day, d.hour, d.minute, d.second);
}

DateTime _nextSolar(
  DateTime target,
  RepeatRule rule,
  int interval,
  DateTime after,
) {
  var next = target;
  var guard = 0;
  while (!next.isAfter(after) && guard++ < 4000) {
    next = switch (rule) {
      RepeatRule.weekly => next.add(Duration(days: 7 * interval)),
      RepeatRule.monthly => addMonthsClamped(next, interval),
      RepeatRule.yearly => addMonthsClamped(next, 12 * interval),
      _ => after.add(const Duration(days: 1)),
    };
  }
  return next;
}

/// The next occurrence of [c] strictly after [after]. Non-repeating events
/// return their original target.
DateTime nextOccurrenceAfter(Countdown c, DateTime after) {
  final interval = c.repeatInterval < 1 ? 1 : c.repeatInterval;
  return switch (c.repeatRule) {
    RepeatRule.none => c.target,
    RepeatRule.lunarYearly => nextLunarYearly(c.target, after),
    _ => _nextSolar(c.target, c.repeatRule, interval, after),
  };
}

/// The target to display/act on right now: a repeating event whose stored
/// target has already passed is rolled forward to its next occurrence.
DateTime effectiveTarget(Countdown c, DateTime now) {
  if (c.repeatRule == RepeatRule.none || c.target.isAfter(now)) return c.target;
  return nextOccurrenceAfter(c, now);
}
