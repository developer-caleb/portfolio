// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _AuthApi implements AuthApi {
  _AuthApi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GuestLoginDto> guestLogin(userModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GuestLoginDto>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/auth/signin/guest',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GuestLoginDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OnlyResultDto> modifyUserInfo(userSeq, userModel) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(userModel.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OnlyResultDto>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/member/${userSeq}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OnlyResultDto.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
