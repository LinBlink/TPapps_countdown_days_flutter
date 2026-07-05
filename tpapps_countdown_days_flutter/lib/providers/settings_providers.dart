import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repositories/settings_repository.dart';
import '../domain/enums.dart';
import '../domain/models/app_settings.dart';

part 'settings_providers.g.dart';

/// Overridden in `main()` with the instance loaded before `runApp`.
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(Ref ref) =>
    throw UnimplementedError('sharedPreferencesProvider must be overridden');

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(Ref ref) =>
    SettingsRepository(ref.watch(sharedPreferencesProvider));

/// App-wide user settings. Synchronous because prefs are loaded before runApp.
@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  @override
  AppSettings build() => ref.watch(settingsRepositoryProvider).load();

  void _update(AppSettings next) {
    state = next;
    ref.read(settingsRepositoryProvider).save(next);
  }

  void setLocale(AppLocaleOption v) => _update(state.copyWith(locale: v));
  void setThemeMode(AppThemeMode v) => _update(state.copyWith(themeMode: v));
  void setDefaultPrecision(Precision v) =>
      _update(state.copyWith(defaultPrecision: v));
  void setFirstDayMonday(bool v) => _update(state.copyWith(firstDayMonday: v));
  void setShowLunar(bool v) => _update(state.copyWith(showLunar: v));
  void setDefaultSound(String v) => _update(state.copyWith(defaultSoundId: v));
}
