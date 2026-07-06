// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  id: json['id'] as String,
  displayName: json['displayName'] as String,
  email: json['email'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  provider: json['provider'] as String,
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  'id': instance.id,
  'displayName': instance.displayName,
  'email': instance.email,
  'avatarUrl': instance.avatarUrl,
  'provider': instance.provider,
};

AuthTokensDto _$AuthTokensDtoFromJson(Map<String, dynamic> json) =>
    AuthTokensDto(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresInMs: (json['expiresInMs'] as num).toInt(),
    );

Map<String, dynamic> _$AuthTokensDtoToJson(AuthTokensDto instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'expiresInMs': instance.expiresInMs,
    };

AuthResponseDto _$AuthResponseDtoFromJson(Map<String, dynamic> json) =>
    AuthResponseDto(
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      tokens: AuthTokensDto.fromJson(json['tokens'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseDtoToJson(AuthResponseDto instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'tokens': instance.tokens.toJson(),
    };

SyncResponseDto _$SyncResponseDtoFromJson(Map<String, dynamic> json) =>
    SyncResponseDto(
      serverTimeMs: (json['serverTimeMs'] as num).toInt(),
      changes: (json['changes'] as List<dynamic>)
          .map((e) => CountdownDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SyncResponseDtoToJson(SyncResponseDto instance) =>
    <String, dynamic>{
      'serverTimeMs': instance.serverTimeMs,
      'changes': instance.changes.map((e) => e.toJson()).toList(),
    };

CreateShareResponseDto _$CreateShareResponseDtoFromJson(
  Map<String, dynamic> json,
) => CreateShareResponseDto(
  code: json['code'] as String,
  url: json['url'] as String,
  expiresAtMs: (json['expiresAtMs'] as num).toInt(),
);

Map<String, dynamic> _$CreateShareResponseDtoToJson(
  CreateShareResponseDto instance,
) => <String, dynamic>{
  'code': instance.code,
  'url': instance.url,
  'expiresAtMs': instance.expiresAtMs,
};

ShareDto _$ShareDtoFromJson(Map<String, dynamic> json) => ShareDto(
  code: json['code'] as String,
  url: json['url'] as String,
  expiresAtMs: (json['expiresAtMs'] as num).toInt(),
  snapshot: CountdownDto.fromJson(json['snapshot'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ShareDtoToJson(ShareDto instance) => <String, dynamic>{
  'code': instance.code,
  'url': instance.url,
  'expiresAtMs': instance.expiresAtMs,
  'snapshot': instance.snapshot.toJson(),
};
