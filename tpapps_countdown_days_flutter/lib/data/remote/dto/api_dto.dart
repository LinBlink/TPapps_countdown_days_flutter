import 'package:json_annotation/json_annotation.dart';

import 'countdown_dto.dart';

part 'api_dto.g.dart';

@JsonSerializable()
class UserDto {
  UserDto({
    required this.id,
    required this.displayName,
    this.email,
    this.avatarUrl,
    required this.provider,
  });

  final String id;
  final String displayName;
  final String? email;
  final String? avatarUrl;
  final String provider; // apple | google

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

@JsonSerializable()
class AuthTokensDto {
  AuthTokensDto({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresInMs,
  });

  final String accessToken;
  final String refreshToken;
  final int expiresInMs;

  factory AuthTokensDto.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthTokensDtoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AuthResponseDto {
  AuthResponseDto({required this.user, required this.tokens});

  final UserDto user;
  final AuthTokensDto tokens;

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseDtoToJson(this);
}

/// Delta-sync response: the server's clock plus every record changed since the
/// client's `sinceMs` (including tombstones with `deleted: true`).
@JsonSerializable(explicitToJson: true)
class SyncResponseDto {
  SyncResponseDto({required this.serverTimeMs, required this.changes});

  final int serverTimeMs;
  final List<CountdownDto> changes;

  factory SyncResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SyncResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SyncResponseDtoToJson(this);
}

@JsonSerializable()
class CreateShareResponseDto {
  CreateShareResponseDto({
    required this.code,
    required this.url,
    required this.expiresAtMs,
  });

  final String code;
  final String url;
  final int expiresAtMs;

  factory CreateShareResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CreateShareResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateShareResponseDtoToJson(this);
}

/// Public resolution of a share code → a countdown snapshot for QR import.
@JsonSerializable(explicitToJson: true)
class ShareDto {
  ShareDto({
    required this.code,
    required this.url,
    required this.expiresAtMs,
    required this.snapshot,
  });

  final String code;
  final String url;
  final int expiresAtMs;
  final CountdownDto snapshot;

  factory ShareDto.fromJson(Map<String, dynamic> json) =>
      _$ShareDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ShareDtoToJson(this);
}
