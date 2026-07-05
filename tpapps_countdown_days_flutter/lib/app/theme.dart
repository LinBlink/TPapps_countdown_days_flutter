import 'package:flutter/cupertino.dart';

/// Curated iOS-flavoured palette for event accent colors (shown in the color
/// picker). Stored on a countdown as an ARGB int (`colorValue`).
abstract final class AppPalette {
  static const eventColors = <int>[
    0xFF0A84FF, // blue
    0xFF30D158, // green
    0xFFFF375F, // pink/red
    0xFFFF9F0A, // orange
    0xFFBF5AF2, // purple
    0xFF64D2FF, // teal
    0xFFFFD60A, // yellow
    0xFFFF453A, // red
    0xFF5E5CE6, // indigo
    0xFF8E8E93, // grey
  ];

  static const eventEmojis = <String>[
    '📅', '🎂', '❤️', '🎉', '✈️', '🎓', '💼', '🏠', '💍', '🎯',
    '🌸', '⛰️', '🎄', '🧧', '📖', '⏰',
  ];
}

/// Builds the app-wide Cupertino theme. A null [brightness] means "follow the
/// system", which Cupertino resolves from `MediaQuery` automatically.
CupertinoThemeData buildTheme(Brightness? brightness) {
  return CupertinoThemeData(
    brightness: brightness,
    primaryColor: CupertinoColors.systemBlue,
    scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
    barBackgroundColor: CupertinoColors.systemBackground,
    applyThemeToAll: true,
  );
}
