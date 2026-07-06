import 'dart:convert';
import 'dart:typed_data';

import 'package:share_plus/share_plus.dart';

import '../data/repositories/countdown_repository.dart';
import '../domain/models/countdown.dart';

/// JSON backup of all countdowns. Export shares a `.json` file via the system
/// share sheet (no temp file / native picker needed). [decode] parses a backup
/// document, ready to be handed to `CountdownRepository.replaceAll` on import.
class BackupService {
  BackupService(this._repo);

  final CountdownRepository _repo;
  static const currentVersion = 1;

  Future<void> exportAll() async {
    final items = await _repo.getAll();
    final doc = {
      'version': currentVersion,
      'exportedAt': DateTime.now().toIso8601String(),
      'countdowns': [for (final c in items) c.toJson()],
    };
    final bytes = Uint8List.fromList(utf8.encode(jsonEncode(doc)));
    await SharePlus.instance.share(
      ShareParams(
        files: [
          XFile.fromData(
            bytes,
            mimeType: 'application/json',
            name: 'countdown-backup.json',
          ),
        ],
        fileNameOverrides: const ['countdown-backup.json'],
      ),
    );
  }

  /// Parses a backup document string into countdowns. Throws [FormatException]
  /// on malformed input.
  static List<Countdown> decode(String jsonString) {
    final doc = jsonDecode(jsonString);
    if (doc is! Map || doc['countdowns'] is! List) {
      throw const FormatException('Not a countdown backup');
    }
    return [
      for (final raw in doc['countdowns'] as List)
        Countdown.fromJson(raw as Map<String, dynamic>),
    ];
  }
}
