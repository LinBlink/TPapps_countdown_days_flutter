import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/enums.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers/settings_providers.dart';

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
                  onTap: () => _pickLocale(context, l, controller),
                ),
                CupertinoListTile(
                  title: Text(l.theme),
                  additionalInfo: Text(_themeLabel(l, settings.themeMode)),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => _pickTheme(context, l, controller),
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

  Future<void> _pickLocale(
    BuildContext context,
    AppLocalizations l,
    Settings controller,
  ) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (sheetContext) => CupertinoActionSheet(
        title: Text(l.language),
        actions: [
          for (final option in AppLocaleOption.values)
            CupertinoActionSheetAction(
              onPressed: () {
                controller.setLocale(option);
                Navigator.pop(sheetContext);
              },
              child: Text(_localeLabel(l, option)),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(sheetContext),
          child: Text(l.actionCancel),
        ),
      ),
    );
  }

  Future<void> _pickTheme(
    BuildContext context,
    AppLocalizations l,
    Settings controller,
  ) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (sheetContext) => CupertinoActionSheet(
        title: Text(l.theme),
        actions: [
          for (final option in AppThemeMode.values)
            CupertinoActionSheetAction(
              onPressed: () {
                controller.setThemeMode(option);
                Navigator.pop(sheetContext);
              },
              child: Text(_themeLabel(l, option)),
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
