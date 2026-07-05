/// Calendar-day helpers used by the list display (day-granularity), distinct
/// from the millisecond-accurate live countdown in `precision_formatter.dart`.
library;

DateTime dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

/// Whole calendar days from [from] to [to] (ignores the time of day).
/// Positive when [to] is in the future. Uses UTC-normalised midnights so DST
/// transitions don't produce 23/25-hour off-by-ones.
int wholeDaysBetween(DateTime from, DateTime to) {
  final a = DateTime.utc(from.year, from.month, from.day);
  final b = DateTime.utc(to.year, to.month, to.day);
  return b.difference(a).inDays;
}

bool isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
