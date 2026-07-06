import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

import '../core/time/recurrence.dart';
import '../domain/models/countdown.dart';

/// Schedules and cancels local reminder notifications. All calls are guarded so
/// they safely no-op on platforms the plugin doesn't support (web, Windows) and
/// never throw into the UI.
class NotificationService {
  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();
  bool _ready = false;

  static const _channelId = 'countdown_reminders';

  static bool get _supported {
    if (kIsWeb) return false;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
        return true;
      default:
        return false;
    }
  }

  Future<void> init() async {
    if (!_supported) return;
    try {
      tzdata.initializeTimeZones();
      final info = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(info.identifier));
    } catch (_) {
      // Leave tz.local at its default; scheduling still works approximately.
    }
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwin = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const linux = LinuxInitializationSettings(defaultActionName: 'Open');
    try {
      await _plugin.initialize(
        settings: const InitializationSettings(
          android: android,
          iOS: darwin,
          macOS: darwin,
          linux: linux,
        ),
      );
      _ready = true;
    } catch (_) {
      _ready = false;
    }
  }

  /// Requests OS permission (Android 13+ POST_NOTIFICATIONS + exact alarms,
  /// iOS/macOS alert/badge/sound). Returns whether notifications are allowed.
  Future<bool> requestPermissions() async {
    if (!_supported || !_ready) return false;
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android != null) {
      final granted = await android.requestNotificationsPermission() ?? false;
      await android.requestExactAlarmsPermission();
      return granted;
    }
    final ios = _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    if (ios != null) {
      return await ios.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          ) ??
          false;
    }
    final macos = _plugin
        .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin
        >();
    if (macos != null) {
      return await macos.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          ) ??
          false;
    }
    return true;
  }

  /// Cancels then (re)schedules every enabled reminder for [c]. Reminders whose
  /// trigger time is already in the past are skipped.
  Future<void> scheduleForCountdown(Countdown c) async {
    if (!_supported || !_ready) return;
    await cancelForCountdown(c);
    if (c.deleted) return;

    final now = DateTime.now();
    final target = effectiveTarget(c, now);
    final body = DateFormat.yMMMMEEEEd().format(target);

    for (final r in c.reminders) {
      if (!r.enabled) continue;
      final triggerLocal = target.subtract(r.offset);
      if (!triggerLocal.isAfter(now)) continue;
      try {
        await _plugin.zonedSchedule(
          id: r.notifId,
          title: c.title,
          body: body,
          scheduledDate: tz.TZDateTime.from(triggerLocal, tz.local),
          notificationDetails: _details(r.soundId),
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        );
      } catch (_) {
        // Missing exact-alarm permission etc. — ignore, keep the app usable.
      }
    }
  }

  Future<void> cancelForCountdown(Countdown c) async {
    if (!_supported || !_ready) return;
    for (final r in c.reminders) {
      try {
        await _plugin.cancel(id: r.notifId);
      } catch (_) {}
    }
  }

  NotificationDetails _details(String soundId) {
    final isDefault = soundId == 'default';
    final android = AndroidNotificationDetails(
      _channelId,
      'Countdown reminders',
      channelDescription: 'Reminders for your countdown events',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: isDefault ? null : RawResourceAndroidNotificationSound(soundId),
    );
    final darwin = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      sound: isDefault ? null : '$soundId.caf',
    );
    return NotificationDetails(android: android, iOS: darwin, macOS: darwin);
  }
}
