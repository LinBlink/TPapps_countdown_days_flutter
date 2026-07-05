// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Emits the current time on a cadence matched to [precision], so only the
/// live-countdown widget rebuilds — and only as often as its finest visible
/// unit changes. Auto-disposes when nothing is watching (e.g. leaving detail),
/// stopping the timer and saving battery.

@ProviderFor(nowTicker)
final nowTickerProvider = NowTickerFamily._();

/// Emits the current time on a cadence matched to [precision], so only the
/// live-countdown widget rebuilds — and only as often as its finest visible
/// unit changes. Auto-disposes when nothing is watching (e.g. leaving detail),
/// stopping the timer and saving battery.

final class NowTickerProvider
    extends
        $FunctionalProvider<AsyncValue<DateTime>, DateTime, Stream<DateTime>>
    with $FutureModifier<DateTime>, $StreamProvider<DateTime> {
  /// Emits the current time on a cadence matched to [precision], so only the
  /// live-countdown widget rebuilds — and only as often as its finest visible
  /// unit changes. Auto-disposes when nothing is watching (e.g. leaving detail),
  /// stopping the timer and saving battery.
  NowTickerProvider._({
    required NowTickerFamily super.from,
    required Precision super.argument,
  }) : super(
         retry: null,
         name: r'nowTickerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$nowTickerHash();

  @override
  String toString() {
    return r'nowTickerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<DateTime> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<DateTime> create(Ref ref) {
    final argument = this.argument as Precision;
    return nowTicker(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is NowTickerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$nowTickerHash() => r'cd020949d120c505237ce59a7735235ff03e3cb6';

/// Emits the current time on a cadence matched to [precision], so only the
/// live-countdown widget rebuilds — and only as often as its finest visible
/// unit changes. Auto-disposes when nothing is watching (e.g. leaving detail),
/// stopping the timer and saving battery.

final class NowTickerFamily extends $Family
    with $FunctionalFamilyOverride<Stream<DateTime>, Precision> {
  NowTickerFamily._()
    : super(
        retry: null,
        name: r'nowTickerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Emits the current time on a cadence matched to [precision], so only the
  /// live-countdown widget rebuilds — and only as often as its finest visible
  /// unit changes. Auto-disposes when nothing is watching (e.g. leaving detail),
  /// stopping the timer and saving battery.

  NowTickerProvider call(Precision precision) =>
      NowTickerProvider._(argument: precision, from: this);

  @override
  String toString() => r'nowTickerProvider';
}
