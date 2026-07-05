import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';
import 'reminder.dart';

part 'countdown.freezed.dart';
part 'countdown.g.dart';

/// A countdown / count-up event.
///
/// [target] is always the concrete **solar** local date-time of the (next)
/// occurrence — even for lunar events, where it is derived by converting the
/// user's chosen lunar date to solar. [calendarType] and [lunarLeapMonth] carry
/// the extra info needed to display the lunar date and to roll `lunarYearly`
/// repeats forward. Storing only the solar instant keeps countdown math and
/// notification scheduling trivial while still supporting 农历 semantics.
@freezed
abstract class Countdown with _$Countdown {
  const factory Countdown({
    required String id,
    required String title,
    String? note,
    required DateTime target,
    @Default(true) bool allDay,
    @Default(CalendarType.solar) CalendarType calendarType,
    @Default(false) bool lunarLeapMonth,
    @Default(Direction.countdown) Direction direction,
    @Default(Precision.day) Precision precision,
    @Default(RepeatRule.none) RepeatRule repeatRule,
    @Default(1) int repeatInterval,
    String? categoryId,
    @Default(0xFF0A84FF) int colorValue,
    @Default('📅') String icon,
    String? coverPath,
    @Default(false) bool pinned,
    @Default(0) int sortOrder,
    @Default(<Reminder>[]) List<Reminder> reminders,
    required DateTime createdAt,
    required DateTime updatedAt,
    // --- fields reserved for cloud sync (unused in Phase 1) ---
    String? remoteId,
    @Default(SyncState.localOnly) SyncState syncState,
    @Default(false) bool deleted,
  }) = _Countdown;

  const Countdown._();

  factory Countdown.fromJson(Map<String, dynamic> json) =>
      _$CountdownFromJson(json);

  /// Signed time from now to [target]. Positive = in the future.
  Duration remainingFrom(DateTime now) => target.difference(now);

  bool isPastAt(DateTime now) => !target.isAfter(now);

  bool get repeats => repeatRule != RepeatRule.none;
}
