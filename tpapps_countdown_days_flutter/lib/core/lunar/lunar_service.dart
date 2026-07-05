import 'package:lunar/lunar.dart';

/// Chinese lunar calendar (农历) helpers built on the `lunar` package.
///
/// Convention: a lunar month is **negative** when it is a leap month (闰月).
class LunarInfo {
  const LunarInfo({
    required this.year,
    required this.month,
    required this.day,
    required this.isLeapMonth,
    required this.monthText,
    required this.dayText,
    required this.zodiac,
    required this.solarTerm,
    required this.festivals,
  });

  final int year, month, day;
  final bool isLeapMonth;
  final String monthText, dayText, zodiac;
  final String? solarTerm;
  final List<String> festivals;

  /// e.g. "八月十五"; a leap month reads "闰八月十五" (via [monthText]).
  String get monthDay => '$monthText月$dayText';
}

LunarInfo lunarInfoOf(DateTime solarDate) {
  final lunar = Solar.fromDate(solarDate).getLunar();
  final jq = lunar.getJieQi();
  return LunarInfo(
    year: lunar.getYear(),
    month: lunar.getMonth().abs(),
    day: lunar.getDay(),
    isLeapMonth: lunar.getMonth() < 0,
    monthText: lunar.getMonthInChinese(),
    dayText: lunar.getDayInChinese(),
    zodiac: lunar.getYearShengXiao(),
    solarTerm: jq.isEmpty ? null : jq,
    festivals: lunar.getFestivals(),
  );
}

/// Converts a lunar date to a solar [DateTime], keeping the time-of-day from
/// [timeSource]. Falls back from a leap month to the ordinary month when the
/// year has no such leap month, and clamps the day to the month length.
DateTime? lunarToSolar(
  int lunarYear,
  int signedMonth,
  int day,
  DateTime timeSource,
) {
  var m = signedMonth;
  var lm = LunarMonth.fromYm(lunarYear, m);
  if (lm == null) {
    m = m.abs();
    lm = LunarMonth.fromYm(lunarYear, m);
    if (lm == null) return null;
  }
  final d = day.clamp(1, lm.getDayCount());
  final solar = Lunar.fromYmd(lunarYear, m, d).getSolar();
  return DateTime(
    solar.getYear(),
    solar.getMonth(),
    solar.getDay(),
    timeSource.hour,
    timeSource.minute,
    timeSource.second,
  );
}

/// Next solar date strictly after [after] whose lunar month/day matches that of
/// [storedSolarTarget]. Powers 农历生日 (lunarYearly) recurrence.
DateTime nextLunarYearly(DateTime storedSolarTarget, DateTime after) {
  final base = Solar.fromDate(storedSolarTarget).getLunar();
  final signedMonth = base.getMonth();
  final day = base.getDay();
  final startYear = Solar.fromDate(after).getLunar().getYear();
  for (var i = 0; i <= 5; i++) {
    final candidate =
        lunarToSolar(startYear + i, signedMonth, day, storedSolarTarget);
    if (candidate != null && candidate.isAfter(after)) return candidate;
  }
  return storedSolarTarget;
}
