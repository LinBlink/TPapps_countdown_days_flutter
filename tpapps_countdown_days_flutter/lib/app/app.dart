import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/enums.dart';
import '../l10n/generated/app_localizations.dart';
import '../providers/settings_providers.dart';
import 'router.dart';
import 'theme.dart';

/// Root widget. Reads locale + theme from settings and drives a Cupertino app.
class CountdownApp extends ConsumerWidget {
  const CountdownApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    final brightness = switch (settings.themeMode) {
      AppThemeMode.system => null,
      AppThemeMode.light => Brightness.light,
      AppThemeMode.dark => Brightness.dark,
    };
    final locale = switch (settings.locale) {
      AppLocaleOption.system => null,
      AppLocaleOption.zh => const Locale('zh'),
      AppLocaleOption.en => const Locale('en'),
    };

    return CupertinoApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: buildTheme(brightness),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      routerConfig: appRouter,
    );
  }
}
