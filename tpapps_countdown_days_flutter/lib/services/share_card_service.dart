import 'package:flutter/widgets.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

/// Renders a widget to a PNG off-screen and opens the system share sheet.
/// Passing [context] lets the captured widget inherit the ambient theme,
/// media query and directionality.
class ShareCardService {
  Future<void> shareWidget(
    Widget card, {
    required BuildContext context,
    String fileName = 'countdown.png',
    String? text,
  }) async {
    final bytes = await ScreenshotController().captureFromWidget(
      card,
      context: context,
      pixelRatio: 3,
      delay: const Duration(milliseconds: 100),
    );
    await SharePlus.instance.share(
      ShareParams(
        files: [XFile.fromData(bytes, mimeType: 'image/png', name: fileName)],
        text: text,
      ),
    );
  }
}
