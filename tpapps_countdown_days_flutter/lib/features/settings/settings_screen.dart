import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/sounds.dart';
import '../../domain/enums.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers/repositories.dart';
import '../../providers/settings_providers.dart';
import '../../services/backup_service.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final settings = ref.watch(settingsProvider);
    final controller = ref.read(settingsProvider.notifier);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(l.settings)),
      child: SafeArea(
        child: ListView(
          children: [
            CupertinoListSection.insetGrouped(
              header: Text(l.settingsGeneral),
              children: [
                CupertinoListTile(
                  title: Text(l.language),
                  additionalInfo: Text(_localeLabel(l, settings.locale)),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => _pick<AppLocaleOption>(
                    context,
                    title: l.language,
                    values: AppLocaleOption.values,
                    label: (v) => _localeLabel(l, v),
                    onSelected: controller.setLocale,
                  ),
                ),
                CupertinoListTile(
                  title: Text(l.theme),
                  additionalInfo: Text(_themeLabel(l, settings.themeMode)),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => _pick<AppThemeMode>(
                    context,
                    title: l.theme,
                    values: AppThemeMode.values,
                    label: (v) => _themeLabel(l, v),
                    onSelected: controller.setThemeMode,
                  ),
                ),
                CupertinoListTile(
                  title: Text(l.defaultPrecision),
                  additionalInfo: Text(
                    _precisionLabel(l, settings.defaultPrecision),
                  ),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => _pick<Precision>(
                    context,
                    title: l.defaultPrecision,
                    values: Precision.values,
                    label: (v) => _precisionLabel(l, v),
                    onSelected: controller.setDefaultPrecision,
                  ),
                ),
                CupertinoListTile(
                  title: Text(l.firstDayOfWeek),
                  additionalInfo: Text(
                    settings.firstDayMonday ? l.weekdayMonday : l.weekdaySunday,
                  ),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => _pick<bool>(
                    context,
                    title: l.firstDayOfWeek,
                    values: const [false, true],
                    label: (v) => v ? l.weekdayMonday : l.weekdaySunday,
                    onSelected: controller.setFirstDayMonday,
                  ),
                ),
                CupertinoListTile(
                  title: Text(l.showLunar),
                  trailing: CupertinoSwitch(
                    value: settings.showLunar,
                    onChanged: controller.setShowLunar,
                  ),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: Text(l.reminders),
              children: [
                CupertinoListTile(
                  title: Text(l.notificationSound),
                  additionalInfo: Text(
                    soundLabel(settings.defaultSoundId, l.soundDefault),
                  ),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => _pick<String>(
                    context,
                    title: l.notificationSound,
                    values: kNotificationSounds,
                    label: (v) => soundLabel(v, l.soundDefault),
                    onSelected: controller.setDefaultSound,
                  ),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: Text(l.settingsData),
              children: [
                CupertinoListTile(
                  title: Text(l.exportData),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => BackupService(
                    ref.read(countdownRepositoryProvider),
                  ).exportAll(),
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              header: Text(l.settingsAbout),
              children: [
                CupertinoListTile(
                  title: Text(l.version),
                  additionalInfo: const Text('0.1.0'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pick<T>(
    BuildContext context, {
    required String title,
    required List<T> values,
    required String Function(T) label,
    required ValueChanged<T> onSelected,
  }) async {
    final l = AppLocalizations.of(context);
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (sheetContext) => CupertinoActionSheet(
        title: Text(title),
        actions: [
          for (final v in values)
            CupertinoActionSheetAction(
              onPressed: () {
                onSelected(v);
                Navigator.pop(sheetContext);
              },
              child: Text(label(v)),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(sheetContext),
          child: Text(l.actionCancel),
        ),
      ),
    );
  }
}

String _localeLabel(AppLocalizations l, AppLocaleOption v) => switch (v) {
  AppLocaleOption.system => l.languageSystem,
  AppLocaleOption.zh => l.languageChinese,
  AppLocaleOption.en => l.languageEnglish,
};

String _themeLabel(AppLocalizations l, AppThemeMode v) => switch (v) {
  AppThemeMode.system => l.themeSystem,
  AppThemeMode.light => l.themeLight,
  AppThemeMode.dark => l.themeDark,
};

String _precisionLabel(AppLocalizations l, Precision p) => switch (p) {
  Precision.day => l.precisionDay,
  Precision.hour => l.precisionHour,
  Precision.minute => l.precisionMinute,
  Precision.second => l.precisionSecond,
  Precision.millisecond => l.precisionMillisecond,
};
