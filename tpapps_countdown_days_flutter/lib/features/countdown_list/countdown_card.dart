import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../core/time/date_utils.dart';
import '../../domain/models/countdown.dart';
import '../../l10n/generated/app_localizations.dart';

/// A single row in the countdown list: accent-tinted emoji, title + date, and a
/// large day count on the trailing edge.
class CountdownCard extends StatelessWidget {
  const CountdownCard({super.key, required this.countdown, this.onTap});

  final Countdown countdown;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final color = Color(countdown.colorValue);
    final days = wholeDaysBetween(DateTime.now(), countdown.target);
    final localeName = Localizations.localeOf(context).toString();
    final dateStr = DateFormat.yMMMEd(localeName).format(countdown.target);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: CupertinoColors.secondarySystemGroupedBackground
              .resolveFrom(context),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(countdown.icon, style: const TextStyle(fontSize: 22)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    countdown.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    dateStr,
                    style: TextStyle(
                      fontSize: 13,
                      color: CupertinoColors.secondaryLabel.resolveFrom(context),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            _DayBadge(days: days, color: color, todayLabel: l.isToday),
          ],
        ),
      ),
    );
  }
}

class _DayBadge extends StatelessWidget {
  const _DayBadge({
    required this.days,
    required this.color,
    required this.todayLabel,
  });

  final int days;
  final Color color;
  final String todayLabel;

  @override
  Widget build(BuildContext context) {
    if (days == 0) {
      return Text(
        todayLabel,
        style: TextStyle(color: color, fontSize: 17, fontWeight: FontWeight.w700),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${days.abs()}',
          style: TextStyle(
            color: color,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
        ),
        Text(
          AppLocalizations.of(context).unitDay,
          style: TextStyle(
            fontSize: 12,
            color: CupertinoColors.secondaryLabel.resolveFrom(context),
          ),
        ),
      ],
    );
  }
}
