import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'providers/services.dart';
import 'providers/settings_providers.dart';
import 'services/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load settings synchronously up-front so the first frame has the right
  // locale + theme (no flash of default UI).
  final prefs = await SharedPreferences.getInstance();

  // Initialize local notifications (no-ops on unsupported platforms).
  final notifications = NotificationService();
  await notifications.init();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        notificationServiceProvider.overrideWithValue(notifications),
      ],
      child: const CountdownApp(),
    ),
  );
}
