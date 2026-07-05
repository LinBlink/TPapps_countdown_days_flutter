# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project state

Freshly scaffolded Flutter app intended to become a "countdown days" app (per the project name `tpapps_countdown_days_flutter`). Currently `lib/main.dart` is the default "Hello World!" scaffold and there are no tests yet — treat most of this repo as greenfield. The `application`/`namespace` IDs are still the `com.example.tpapps_countdown_days_flutter` placeholder (see the TODOs in `android/app/build.gradle.kts`); these must change before any release.

- Toolchain: Flutter 3.44.2 (stable) / Dart 3.12.2. Dart SDK constraint is `^3.12.2` (`pubspec.yaml`).
- Targets all six platforms: `android/`, `ios/`, `linux/`, `macos/`, `web/`, `windows/`.
- Not yet a git repository.

## Commands

```bash
flutter pub get              # install/resolve dependencies (run after editing pubspec.yaml)
flutter run                  # run on the default connected device; -d chrome|windows|macos|linux to pick one
flutter analyze              # static analysis / lint (see analysis_options.yaml)
dart format .                # format all Dart sources
flutter test                 # run all tests (none exist yet — test/ dir is absent)
flutter test path/to/foo_test.dart              # run a single test file
flutter test --plain-name "description substring" # run tests matching a name
flutter build apk|ios|web|windows|macos|linux   # release build for a platform
```

## Architecture

Standard Flutter layout. All Dart application code lives under `lib/` with `lib/main.dart` as the entry point (`main()` → `runApp(const MainApp())`). The per-platform directories (`android/`, `ios/`, etc.) are generated native host projects — only touch them for platform config (signing, icons, permissions, app IDs), not app logic.

As the app grows, put feature/UI/model code under `lib/` and mirror it under `test/` (e.g. `test/foo_test.dart`), which does not exist yet.

## Conventions

Linting uses the default `flutter_lints` ruleset via `include: package:flutter_lints/flutter.yaml` in `analysis_options.yaml`. Run `flutter analyze` before considering a change complete. Android compiles against Java/JVM 17.
