import 'package:dio/dio.dart';

import 'api_config.dart';
import 'dto/api_dto.dart';
import 'dto/countdown_dto.dart';
import 'remote_api.dart';

/// Live [RemoteApi] backed by `dio`. Each method targets the endpoint named in
/// its doc comment on [RemoteApi] / `docs/backend-api.md`.
class DioRemoteApi implements RemoteApi {
  DioRemoteApi(this._dio);

  factory DioRemoteApi.create(ApiConfig config) => DioRemoteApi(
    Dio(BaseOptions(baseUrl: config.baseUrl, contentType: 'application/json')),
  );

  final Dio _dio;

  Options _bearer(String token) =>
      Options(headers: {'Authorization': 'Bearer $token'});

  Map<String, dynamic> _obj(Object? data) =>
      (data as Map).cast<String, dynamic>();

  @override
  Future<AuthResponseDto> authenticate({
    required String provider,
    required String idToken,
  }) async {
    final res = await _dio.post(
      '/v1/auth/$provider',
      data: {'idToken': idToken},
    );
    return AuthResponseDto.fromJson(_obj(res.data));
  }

  @override
  Future<AuthTokensDto> refresh(String refreshToken) async {
    final res = await _dio.post(
      '/v1/auth/refresh',
      data: {'refreshToken': refreshToken},
    );
    return AuthTokensDto.fromJson(_obj(res.data));
  }

  @override
  Future<UserDto> me(String accessToken) async {
    final res = await _dio.get('/v1/me', options: _bearer(accessToken));
    return UserDto.fromJson(_obj(res.data));
  }

  @override
  Future<SyncResponseDto> sync({
    required String accessToken,
    required int? sinceMs,
    required List<CountdownDto> changes,
  }) async {
    final res = await _dio.post(
      '/v1/sync',
      options: _bearer(accessToken),
      data: {
        'sinceMs': sinceMs,
        'changes': [for (final c in changes) c.toJson()],
      },
    );
    return SyncResponseDto.fromJson(_obj(res.data));
  }

  @override
  Future<CreateShareResponseDto> createShare({
    required String accessToken,
    String? countdownId,
    CountdownDto? snapshot,
  }) async {
    final res = await _dio.post(
      '/v1/shares',
      options: _bearer(accessToken),
      data: {'countdownId': countdownId, 'snapshot': snapshot?.toJson()},
    );
    return CreateShareResponseDto.fromJson(_obj(res.data));
  }

  @override
  Future<ShareDto> resolveShare(String code) async {
    final res = await _dio.get('/v1/shares/$code');
    return ShareDto.fromJson(_obj(res.data));
  }

  @override
  Future<CountdownDto> importShare({
    required String accessToken,
    required String code,
  }) async {
    final res = await _dio.post(
      '/v1/shares/$code/import',
      options: _bearer(accessToken),
    );
    return CountdownDto.fromJson(_obj(res.data));
  }
}
