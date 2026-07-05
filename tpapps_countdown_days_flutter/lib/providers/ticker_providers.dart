import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/enums.dart';

part 'ticker_providers.g.dart';

/// Emits the current time on a cadence matched to [precision], so only the
/// live-countdown widget rebuilds — and only as often as its finest visible
/// unit changes. Auto-disposes when nothing is watching (e.g. leaving detail),
/// stopping the timer and saving battery.
@riverpod
Stream<DateTime> nowTicker(Ref ref, Precision precision) async* {
  final interval = switch (precision) {
    Precision.millisecond => const Duration(milliseconds: 33),
    Precision.second => const Duration(seconds: 1),
    Precision.minute => const Duration(seconds: 10),
    Precision.hour => const Duration(minutes: 1),
    Precision.day => const Duration(minutes: 5),
  };
  yield DateTime.now();
  yield* Stream<DateTime>.periodic(interval, (_) => DateTime.now());
}
