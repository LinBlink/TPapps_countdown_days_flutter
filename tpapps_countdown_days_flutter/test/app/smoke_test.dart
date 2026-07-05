import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tpapps_countdown_days_flutter/app/app.dart';
import 'package:tpapps_countdown_days_flutter/domain/models/countdown.dart';
import 'package:tpapps_countdown_days_flutter/providers/repositories.dart';
import 'package:tpapps_countdown_days_flutter/providers/settings_providers.dart';

void main() {
  testWidgets('app boots to the home screen and shows the empty state',
      (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    // Override the list stream with a closed, empty stream so the smoke test
    // exercises the shell (routing/theme/l10n/empty state) without the Drift
    // stream — whose query timer otherwise outlives the test's fake-async zone.
    // The DB -> UI path is covered by countdown_repository_test.dart.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
          countdownListProvider
              .overrideWith((ref) => Stream.value(const <Countdown>[])),
        ],
        child: const CountdownApp(),
      ),
    );
    await tester.pump(); // flush the single stream emission

    expect(find.text('Countdown'), findsWidgets);
    expect(find.text('No countdowns yet'), findsOneWidget);
  }, timeout: const Timeout(Duration(seconds: 30)));
}
