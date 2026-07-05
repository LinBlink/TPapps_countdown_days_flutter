/// Selectable notification sound ids.
///
/// `default` uses the system sound. The others expect a bundled asset named
/// `<id>` — an Android raw resource `android/app/src/main/res/raw/<id>.<ext>`
/// and an iOS bundle sound `<id>.caf`. Until those files are added the OS falls
/// back to the default sound, so selecting them is harmless.
const kNotificationSounds = <String>[
  'default',
  'chime',
  'bell',
  'marimba',
  'alarm',
];

/// A human-readable label for a sound id (non-default ids are title-cased).
String soundLabel(String id, String defaultLabel) {
  if (id == 'default') return defaultLabel;
  return id[0].toUpperCase() + id.substring(1);
}
