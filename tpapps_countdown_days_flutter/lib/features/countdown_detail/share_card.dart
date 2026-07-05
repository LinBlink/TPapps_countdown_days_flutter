import 'package:flutter/widgets.dart';

/// A self-contained, share-friendly card rendered off-screen to a PNG.
///
/// Deliberately avoids `Localizations`/dynamic colors: all display strings and
/// the accent color are passed in so it renders correctly in isolation.
class ShareCard extends StatelessWidget {
  const ShareCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.headline,
    required this.dateText,
    this.lunarText,
  });

  final String title;
  final String icon;
  final Color color;
  final String headline;
  final String dateText;
  final String? lunarText;

  static const _white = Color(0xFFFFFFFF);
  static const _white70 = Color(0xB3FFFFFF);
  static const _white54 = Color(0x8AFFFFFF);

  @override
  Widget build(BuildContext context) {
    final darker = Color.lerp(color, const Color(0xFF000000), 0.32)!;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        width: 360,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color, darker],
          ),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(icon, style: const TextStyle(fontSize: 44)),
            const SizedBox(height: 14),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: _white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 22),
            Text(
              headline,
              style: const TextStyle(
                color: _white,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              dateText,
              style: const TextStyle(color: _white70, fontSize: 14),
            ),
            if (lunarText != null) ...[
              const SizedBox(height: 4),
              Text(
                lunarText!,
                style: const TextStyle(color: _white70, fontSize: 13),
              ),
            ],
            const SizedBox(height: 20),
            const Text(
              '倒数日 · Countdown',
              style: TextStyle(color: _white54, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
