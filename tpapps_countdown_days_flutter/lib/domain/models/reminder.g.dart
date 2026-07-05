// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reminder _$ReminderFromJson(Map<String, dynamic> json) => _Reminder(
  id: json['id'] as String,
  countdownId: json['countdownId'] as String,
  enabled: json['enabled'] as bool? ?? true,
  offsetDays: (json['offsetDays'] as num?)?.toInt() ?? 0,
  offsetHours: (json['offsetHours'] as num?)?.toInt() ?? 0,
  offsetMinutes: (json['offsetMinutes'] as num?)?.toInt() ?? 0,
  soundId: json['soundId'] as String? ?? 'default',
  notifId: (json['notifId'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ReminderToJson(_Reminder instance) => <String, dynamic>{
  'id': instance.id,
  'countdownId': instance.countdownId,
  'enabled': instance.enabled,
  'offsetDays': instance.offsetDays,
  'offsetHours': instance.offsetHours,
  'offsetMinutes': instance.offsetMinutes,
  'soundId': instance.soundId,
  'notifId': instance.notifId,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};
