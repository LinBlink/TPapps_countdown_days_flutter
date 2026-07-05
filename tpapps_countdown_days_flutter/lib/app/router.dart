import 'package:go_router/go_router.dart';

import '../features/countdown_detail/countdown_detail_screen.dart';
import '../features/countdown_edit/countdown_edit_screen.dart';
import '../features/countdown_list/countdown_list_screen.dart';
import '../features/settings/settings_screen.dart';

/// Declarative routes. The nested layout keeps a natural back-stack from the
/// list. The reserved `/import` deep link (QR share) is added in a later phase.
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CountdownListScreen(),
      routes: [
        GoRoute(
          path: 'new',
          builder: (context, state) => const CountdownEditScreen(),
        ),
        GoRoute(
          path: 'edit/:id',
          builder: (context, state) =>
              CountdownEditScreen(countdownId: state.pathParameters['id']),
        ),
        GoRoute(
          path: 'countdown/:id',
          builder: (context, state) =>
              CountdownDetailScreen(countdownId: state.pathParameters['id']!),
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);
