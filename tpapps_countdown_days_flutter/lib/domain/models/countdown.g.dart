// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Countdown _$CountdownFromJson(Map<String, dynamic> json) => _Countdown(
  id: json['id'] as String,
  title: json['title'] as String,
  note: json['note'] as String?,
  target: DateTime.parse(json['target'] as String),
  allDay: json['allDay'] as bool? ?? true,
  calendarType:
      $enumDecodeNullable(_$CalendarTypeEnumMap, json['calendarType']) ??
      CalendarType.solar,
  lunarLeapMonth: json['lunarLeapMonth'] as bool? ?? false,
  direction:
      $enumDecodeNullable(_$DirectionEnumMap, json['direction']) ??
      Direction.countdown,
  precision:
      $enumDecodeNullable(_$PrecisionEnumMap, json['precision']) ??
      Precision.day,
  repeatRule:
      $enumDecodeNullable(_$RepeatRuleEnumMap, json['repeatRule']) ??
      RepeatRule.none,
  repeatInterval: (json['repeatInterval'] as num?)?.toInt() ?? 1,
  categoryId: json['categoryId'] as String?,
  colorValue: (json['colorValue'] as num?)?.toInt() ?? 0xFF0A84FF,
  icon: json['icon'] as String? ?? '📅',
  coverPath: json['coverPath'] as String?,
  pinned: json['pinned'] as bool? ?? false,
  sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
  reminders:
      (json['reminders'] as List<dynamic>?)
          ?.map((e) => Reminder.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Reminder>[],
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  remoteId: json['remoteId'] as String?,
  syncState:
      $enumDecodeNullable(_$SyncStateEnumMap, json['syncState']) ??
      SyncState.localOnly,
  deleted: json['deleted'] as bool? ?? false,
);

Map<String, dynamic> _$CountdownToJson(_Countdown instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'note': instance.note,
      'target': instance.target.toIso8601String(),
      'allDay': instance.allDay,
      'calendarType': _$CalendarTypeEnumMap[instance.calendarType]!,
      'lunarLeapMonth': instance.lunarLeapMonth,
      'direction': _$DirectionEnumMap[instance.direction]!,
      'precision': _$PrecisionEnumMap[instance.precision]!,
      'repeatRule': _$RepeatRuleEnumMap[instance.repeatRule]!,
      'repeatInterval': instance.repeatInterval,
      'categoryId': instance.categoryId,
      'colorValue': instance.colorValue,
      'icon': instance.icon,
      'coverPath': instance.coverPath,
      'pinned': instance.pinned,
      'sortOrder': instance.sortOrder,
      'reminders': instance.reminders,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'remoteId': instance.remoteId,
      'syncState': _$SyncStateEnumMap[instance.syncState]!,
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

const _$SyncStateEnumMap = {
  SyncState.localOnly: 'localOnly',
  SyncState.synced: 'synced',
  SyncState.dirty: 'dirty',
  SyncState.pendingDelete: 'pendingDelete',
};
