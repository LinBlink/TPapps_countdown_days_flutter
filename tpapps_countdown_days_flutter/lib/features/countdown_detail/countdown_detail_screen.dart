import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/lunar/lunar_service.dart';
import '../../core/time/date_utils.dart';
import '../../core/time/recurrence.dart';
import '../../domain/enums.dart';
import '../../domain/models/countdown.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers/repositories.dart';
import '../../providers/settings_providers.dart';
import '../../services/share_card_service.dart';
import 'live_countdown.dart';
import 'share_card.dart';

class CountdownDetailScreen extends ConsumerWidget {
  const CountdownDetailScreen({super.key, required this.countdownId});

  final String countdownId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final async = ref.watch(countdownByIdProvider(countdownId));
    final loaded = async.value;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(loaded?.title ?? l.appTitle),
        trailing: loaded == null
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => context.push('/edit/$countdownId'),
                    child: Text(l.actionEdit),
                  ),
                ],
              ),
      ),
      child: async.when(
        loading: () => const Center(child: CupertinoActivityIndicator()),
        error: (e, _) => Center(child: Text('$e')),
        data: (c) => c == null
            ? Center(child: Text(l.listEmptyTitle))
            : _DetailBody(countdown: c),
      ),
    );
  }
}

class _DetailBody extends ConsumerWidget {
  const _DetailBody({required this.countdown});

  final Countdown countdown;

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations l,
  ) async {
    final ok = await showCupertinoDialog<bool>(
      context: context,
      builder: (dialogContext) => CupertinoAlertDialog(
        title: Text(l.deleteConfirmTitle),
        content: Text(l.deleteConfirmMessage),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(l.actionCancel),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(l.actionDelete),
          ),
        ],
      ),
    );
    if (ok == true) {
      await ref.read(countdownRepositoryProvider).softDelete(countdown.id);
      if (context.mounted) context.go('/');
    }
  }

  Future<void> _share(
    BuildContext context,
    AppLocalizations l,
    DateTime effective,
    int days,
    String? lunarText,
  ) async {
    final headline = days == 0
        ? l.isToday
        : (days > 0 ? l.daysLeft(days.abs()) : l.daysSince(days.abs()));
    final localeName = Localizations.localeOf(context).toString();
    await ShareCardService().shareWidget(
      ShareCard(
        title: countdown.title,
        icon: countdown.icon,
        color: Color(countdown.colorValue),
        headline: headline,
        dateText: DateFormat.yMMMMEEEEd(localeName).format(effective),
        lunarText: lunarText,
      ),
      context: context,
      text: '${countdown.title} · $headline',
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final color = Color(countdown.colorValue);
    final now = DateTime.now();
    final effective = effectiveTarget(countdown, now);
    final days = wholeDaysBetween(now, effective);
    final localeName = Localizations.localeOf(context).toString();
    final dateStr = countdown.allDay
        ? DateFormat.yMMMMEEEEd(localeName).format(effective)
        : DateFormat.yMMMMEEEEd(localeName).add_jm().format(effective);

    final showLunar = countdown.calendarType == CalendarType.lunar ||
        ref.watch(settingsProvider).showLunar;
    final lunar = showLunar ? lunarInfoOf(effective) : null;
    final lunarText = lunar == null
        ? null
        : lunar.monthDay +
            (lunar.solarTerm != null ? ' · ${lunar.solarTerm}' : '') +
            (lunar.festivals.isNotEmpty ? ' · ${lunar.festivals.first}' : '');

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 12),
          Center(
            child: Text(countdown.icon, style: const TextStyle(fontSize: 60)),
          ),
          const SizedBox(height: 20),
          Center(
            child: countdown.precision == Precision.day
                ? Text(
                    days == 0
                        ? l.isToday
                        : (days > 0
                            ? l.daysLeft(days.abs())
                            : l.daysSince(days.abs())),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: color,
                    ),
                  )
                : LiveCountdown(
                    target: effective,
                    precision: countdown.precision,
                    color: color,
                  ),
          ),
          const SizedBox(height: 32),
          CupertinoListSection.insetGrouped(
            children: [
              CupertinoListTile(
                title: Text(l.targetDate),
                additionalInfo: Flexible(
                  child: Text(dateStr, overflow: TextOverflow.ellipsis),
                ),
              ),
              if (lunarText != null)
                CupertinoListTile(
                  title: Text(l.lunarDate),
                  additionalInfo: Text(lunarText),
                ),
              if (countdown.repeats)
                CupertinoListTile(
                  title: Text(l.repeats),
                  additionalInfo: Text(_repeatLabel(l, countdown.repeatRule)),
                ),
              CupertinoListTile(
                title: Text(l.reminders),
                additionalInfo: Text(
                  countdown.reminders.where((r) => r.enabled).isEmpty
                      ? l.noReminders
                      : '${countdown.reminders.where((r) => r.enabled).length}',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          CupertinoButton(
            onPressed: () => _share(context, l, effective, days, lunarText),
            child: Text(l.shareAsImage),
          ),
          CupertinoButton(
            onPressed: () => _confirmDelete(context, ref, l),
            child: Text(
              l.actionDelete,
              style: const TextStyle(color: CupertinoColors.destructiveRed),
            ),
          ),
        ],
      ),
    );
  }
}

String _repeatLabel(AppLocalizations l, RepeatRule rule) => switch (rule) {
      RepeatRule.none => l.repeatNone,
      RepeatRule.weekly => l.repeatWeekly,
      RepeatRule.monthly => l.repeatMonthly,
      RepeatRule.yearly => l.repeatYearly,
      RepeatRule.lunarYearly => l.repeatLunarYearly,
    };
