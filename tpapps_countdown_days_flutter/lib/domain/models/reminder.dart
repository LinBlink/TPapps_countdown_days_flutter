import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder.freezed.dart';
part 'reminder.g.dart';

/// A single reminder attached to a countdown, firing a local notification a
/// configurable amount of time *before* the event (提前 N 天 / N 小时 / N 分钟).
/// An offset of all-zero fires at the event moment itself.
@freezed
abstract class Reminder with _$Reminder {
  const factory Reminder({
    required String id,
    required String countdownId,
    @Default(true) bool enabled,
    @Default(0) int offsetDays,
    @Default(0) int offsetHours,
    @Default(0) int offsetMinutes,
    @Default('default') String soundId,

    /// Stable 32-bit id used to schedule/cancel the OS notification.
    required int notifId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Reminder;

  const Reminder._();

  factory Reminder.fromJson(Map<String, dynamic> json) =>
      _$ReminderFromJson(json);

  /// Total lead time before the event that this reminder fires.
  Duration get offset =>
      Duration(days: offsetDays, hours: offsetHours, minutes: offsetMinutes);

  bool get isAtEventTime => offset == Duration.zero;
}
