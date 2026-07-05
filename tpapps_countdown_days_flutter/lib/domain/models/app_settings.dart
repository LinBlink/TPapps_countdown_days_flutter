import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

/// User preferences, persisted via `shared_preferences` (see SettingsRepository).
@freezed
abstract class AppSettings with _$AppSettings {
  const factory AppSettings({
    @Default(AppLocaleOption.system) AppLocaleOption locale,
    @Default(AppThemeMode.system) AppThemeMode themeMode,
    @Default(Precision.day) Precision defaultPrecision,
    @Default(false) bool firstDayMonday,
    @Default(true) bool showLunar,
    @Default('default') String defaultSoundId,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
