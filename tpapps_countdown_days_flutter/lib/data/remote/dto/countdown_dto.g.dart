// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countdown_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReminderDto _$ReminderDtoFromJson(Map<String, dynamic> json) => ReminderDto(
  id: json['id'] as String,
  enabled: json['enabled'] as bool,
  offsetDays: (json['offsetDays'] as num).toInt(),
  offsetHours: (json['offsetHours'] as num).toInt(),
  offsetMinutes: (json['offsetMinutes'] as num).toInt(),
  soundId: json['soundId'] as String,
);

Map<String, dynamic> _$ReminderDtoToJson(ReminderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'enabled': instance.enabled,
      'offsetDays': instance.offsetDays,
      'offsetHours': instance.offsetHours,
      'offsetMinutes': instance.offsetMinutes,
      'soundId': instance.soundId,
    };

CountdownDto _$CountdownDtoFromJson(Map<String, dynamic> json) => CountdownDto(
  id: json['id'] as String,
  title: json['title'] as String,
  note: json['note'] as String?,
  targetMs: (json['targetMs'] as num).toInt(),
  allDay: json['allDay'] as bool,
  calendarType: $enumDecode(_$CalendarTypeEnumMap, json['calendarType']),
  lunarLeapMonth: json['lunarLeapMonth'] as bool,
  direction: $enumDecode(_$DirectionEnumMap, json['direction']),
  precision: $enumDecode(_$PrecisionEnumMap, json['precision']),
  repeatRule: $enumDecode(_$RepeatRuleEnumMap, json['repeatRule']),
  repeatInterval: (json['repeatInterval'] as num).toInt(),
  colorValue: (json['colorValue'] as num).toInt(),
  icon: json['icon'] as String,
  pinned: json['pinned'] as bool,
  sortOrder: (json['sortOrder'] as num).toInt(),
  reminders: (json['reminders'] as List<dynamic>)
      .map((e) => ReminderDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAtMs: (json['createdAtMs'] as num).toInt(),
  updatedAtMs: (json['updatedAtMs'] as num).toInt(),
  deleted: json['deleted'] as bool,
);

Map<String, dynamic> _$CountdownDtoToJson(CountdownDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'note': instance.note,
      'targetMs': instance.targetMs,
      'allDay': instance.allDay,
      'calendarType': _$CalendarTypeEnumMap[instance.calendarType]!,
      'lunarLeapMonth': instance.lunarLeapMonth,
      'direction': _$DirectionEnumMap[instance.direction]!,
      'precision': _$PrecisionEnumMap[instance.precision]!,
      'repeatRule': _$RepeatRuleEnumMap[instance.repeatRule]!,
      'repeatInterval': instance.repeatInterval,
      'colorValue': instance.colorValue,
      'icon': instance.icon,
      'pinned': instance.pinned,
      'sortOrder': instance.sortOrder,
      'reminders': instance.reminders.map((e) => e.toJson()).toList(),
      'createdAtMs': instance.createdAtMs,
      'updatedAtMs': instance.updatedAtMs,
      'deleted': instance.deleted,
    };

const _$CalendarTypeEnumMap = {
  CalendarType.solar: 'solar',
  CalendarType.lunar: 'lunar',
};

const _$DirectionEnumMap = {
  Direction.countdown: 'countdown',
  Direction.countup: 'countup',
};

const _$PrecisionEnumMap = {
  Precision.day: 'day',
  Precision.hour: 'hour',
  Precision.minute: 'minute',
  Precision.second: 'second',
  Precision.millisecond: 'millisecond',
};

const _$RepeatRuleEnumMap = {
  RepeatRule.none: 'none',
  RepeatRule.weekly: 'weekly',
  RepeatRule.monthly: 'monthly',
  RepeatRule.yearly: 'yearly',
  RepeatRule.lunarYearly: 'lunarYearly',
};
