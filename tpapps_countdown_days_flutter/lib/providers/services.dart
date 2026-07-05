import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/notification_service.dart';

part 'services.g.dart';

/// Overridden in `main()` with an already-initialized instance.
@Riverpod(keepAlive: true)
NotificationService notificationService(Ref ref) =>
    throw UnimplementedError('notificationServiceProvider must be overridden');
