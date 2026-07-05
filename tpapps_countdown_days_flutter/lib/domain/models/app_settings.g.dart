// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  locale:
      $enumDecodeNullable(_$AppLocaleOptionEnumMap, json['locale']) ??
      AppLocaleOption.system,
  themeMode:
      $enumDecodeNullable(_$AppThemeModeEnumMap, json['themeMode']) ??
      AppThemeMode.system,
  defaultPrecision:
      $enumDecodeNullable(_$PrecisionEnumMap, json['defaultPrecision']) ??
      Precision.day,
  firstDayMonday: json['firstDayMonday'] as bool? ?? false,
  showLunar: json['showLunar'] as bool? ?? true,
  defaultSoundId: json['defaultSoundId'] as String? ?? 'default',
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'locale': _$AppLocaleOptionEnumMap[instance.locale]!,
      'themeMode': _$AppThemeModeEnumMap[instance.themeMode]!,
      'defaultPrecision': _$PrecisionEnumMap[instance.defaultPrecision]!,
      'firstDayMonday': instance.firstDayMonday,
      'showLunar': instance.showLunar,
      'defaultSoundId': instance.defaultSoundId,
    };

const _$AppLocaleOptionEnumMap = {
  AppLocaleOption.system: 'system',
  AppLocaleOption.zh: 'zh',
  AppLocaleOption.en: 'en',
};

const _$AppThemeModeEnumMap = {
  AppThemeMode.system: 'system',
  AppThemeMode.light: 'light',
  AppThemeMode.dark: 'dark',
};

const _$PrecisionEnumMap = {
  Precision.day: 'day',
  Precision.hour: 'hour',
  Precision.minute: 'minute',
  Precision.second: 'second',
  Precision.millisecond: 'millisecond',
};
