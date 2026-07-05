import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/time/precision_formatter.dart';
import '../../domain/enums.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../providers/ticker_providers.dart';

/// Big, live-updating countdown text. Watches a precision-matched ticker so
/// only this widget rebuilds — and only as often as its finest unit changes.
/// Tabular figures keep the digits from jittering as they tick.
class LiveCountdown extends ConsumerWidget {
  const LiveCountdown({
    super.key,
    required this.target,
    required this.precision,
    required this.color,
  });

  final DateTime target;
  final Precision precision;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final now = ref.watch(nowTickerProvider(precision)).value ?? DateTime.now();
    final labels = PrecisionLabels(
      day: l.unitDay,
      hour: l.unitHour,
      minute: l.unitMinute,
      second: l.unitSecond,
      millisecond: l.unitMillisecond,
    );
    final text = formatCountdown(target.difference(now), precision, labels);
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: precision == Precision.millisecond ? 32 : 38,
        fontWeight: FontWeight.w800,
        color: color,
        fontFeatures: const [FontFeature.tabularFigures()],
      ),
    );
  }
}
