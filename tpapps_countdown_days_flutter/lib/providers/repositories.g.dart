// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The single app-wide Drift database instance.

@ProviderFor(appDatabase)
final appDatabaseProvider = AppDatabaseProvider._();

/// The single app-wide Drift database instance.

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  /// The single app-wide Drift database instance.
  AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'59cce38d45eeaba199eddd097d8e149d66f9f3e1';

@ProviderFor(countdownRepository)
final countdownRepositoryProvider = CountdownRepositoryProvider._();

final class CountdownRepositoryProvider
    extends
        $FunctionalProvider<
          CountdownRepository,
          CountdownRepository,
          CountdownRepository
        >
    with $Provider<CountdownRepository> {
  CountdownRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'countdownRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$countdownRepositoryHash();

  @$internal
  @override
  $ProviderElement<CountdownRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CountdownRepository create(Ref ref) {
    return countdownRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CountdownRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CountdownRepository>(value),
    );
  }
}

String _$countdownRepositoryHash() =>
    r'878b96647ec9720e8339cbe716b875019afa4598';

/// Reactive stream of all (non-deleted) countdowns.

@ProviderFor(countdownList)
final countdownListProvider = CountdownListProvider._();

/// Reactive stream of all (non-deleted) countdowns.

final class CountdownListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Countdown>>,
          List<Countdown>,
          Stream<List<Countdown>>
        >
    with $FutureModifier<List<Countdown>>, $StreamProvider<List<Countdown>> {
  /// Reactive stream of all (non-deleted) countdowns.
  CountdownListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'countdownListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$countdownListHash();

  @$internal
  @override
  $StreamProviderElement<List<Countdown>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Countdown>> create(Ref ref) {
    return countdownList(ref);
  }
}

String _$countdownListHash() => r'a506732d88f494f3cacb7e8317f5c9b1479ec162';

/// Reactive stream of a single countdown by id (null once deleted/missing).

@ProviderFor(countdownById)
final countdownByIdProvider = CountdownByIdFamily._();

/// Reactive stream of a single countdown by id (null once deleted/missing).

final class CountdownByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<Countdown?>,
          Countdown?,
          Stream<Countdown?>
        >
    with $FutureModifier<Countdown?>, $StreamProvider<Countdown?> {
  /// Reactive stream of a single countdown by id (null once deleted/missing).
  CountdownByIdProvider._({
    required CountdownByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'countdownByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$countdownByIdHash();

  @override
  String toString() {
    return r'countdownByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Countdown?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Countdown?> create(Ref ref) {
    final argument = this.argument as String;
    return countdownById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CountdownByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$countdownByIdHash() => r'49e18f924d01fdbb6d47bb091162e64906a7051a';

/// Reactive stream of a single countdown by id (null once deleted/missing).

final class CountdownByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Countdown?>, String> {
  CountdownByIdFamily._()
    : super(
        retry: null,
        name: r'countdownByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Reactive stream of a single countdown by id (null once deleted/missing).

  CountdownByIdProvider call(String id) =>
      CountdownByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'countdownByIdProvider';
}
