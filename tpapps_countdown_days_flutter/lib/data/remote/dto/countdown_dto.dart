import 'package:json_annotation/json_annotation.dart';

import '../../../domain/enums.dart';

part 'countdown_dto.g.dart';

/// Wire format for a reminder. `notifId` is a local-only concern and is
/// intentionally not part of the sync payload.
@JsonSerializable()
class ReminderDto {
  ReminderDto({
    required this.id,
    required this.enabled,
    required this.offsetDays,
    required this.offsetHours,
    required this.offsetMinutes,
    required this.soundId,
  });

  final String id;
  final bool enabled;
  final int offsetDays;
  final int offsetHours;
  final int offsetMinutes;
  final String soundId;

  factory ReminderDto.fromJson(Map<String, dynamic> json) =>
      _$ReminderDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReminderDtoToJson(this);
}

/// Wire format for a countdown. Enums serialise by name; timestamps are epoch
/// milliseconds (UTC). Mirrors the `Countdown` schema in `docs/backend-api.md`.
@JsonSerializable(explicitToJson: true)
class CountdownDto {
  CountdownDto({
    required this.id,
    required this.title,
    required this.note,
    required this.targetMs,
    required this.allDay,
    required this.calendarType,
    required this.lunarLeapMonth,
    required this.direction,
    required this.precision,
    required this.repeatRule,
    required this.repeatInterval,
    required this.colorValue,
    required this.icon,
    required this.pinned,
    required this.sortOrder,
    required this.reminders,
    required this.createdAtMs,
    required this.updatedAtMs,
    required this.deleted,
  });

  final String id;
  final String title;
  final String? note;
  final int targetMs;
  final bool allDay;
  final CalendarType calendarType;
  final bool lunarLeapMonth;
  final Direction direction;
  final Precision precision;
  final RepeatRule repeatRule;
  final int repeatInterval;
  final int colorValue;
  final String icon;
  final bool pinned;
  final int sortOrder;
  final List<ReminderDto> reminders;
  final int createdAtMs;
  final int updatedAtMs;
  final bool deleted;

  factory CountdownDto.fromJson(Map<String, dynamic> json) =>
      _$CountdownDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CountdownDtoToJson(this);
}
