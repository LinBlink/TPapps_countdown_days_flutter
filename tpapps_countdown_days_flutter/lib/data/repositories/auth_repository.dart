import '../remote/dto/api_dto.dart';

enum AuthProvider { apple, google }

/// Third-party sign-in. Provider-agnostic so WeChat etc. can be added later
/// without touching call sites.
abstract interface class AuthRepository {
  UserDto? get currentUser;
  Future<AuthResponseDto> signIn(AuthProvider provider);
  Future<void> signOut();
}

/// Phase-1 placeholder: sign-in is architected but not wired to live provider
/// SDKs / backend yet. Keeps the app fully functional offline.
class StubAuthRepository implements AuthRepository {
  @override
  UserDto? get currentUser => null;

  @override
  Future<AuthResponseDto> signIn(AuthProvider provider) async =>
      throw UnsupportedError('Sign-in is not available in this build');

  @override
  Future<void> signOut() async {}
}
