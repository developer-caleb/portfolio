// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _DiaryApi implements DiaryApi {
  _DiaryApi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CommonRes> saveDiary(userSeq, diaryModelReq) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(diaryModelReq.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CommonRes>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${userSeq}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CommonRes.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetDiariesRes> getDiaries(userSeq, diaryVolumeSeq, writeDate) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'diaryVolumeSeq': diaryVolumeSeq,
      r'writeDate': writeDate
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetDiariesRes>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${userSeq}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetDiariesRes.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetVolumesRes> getVolumes(userSeq) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetVolumesRes>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/volume/${userSeq}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetVolumesRes.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CommonRes> deleteDiary(userSeq, deleteDiaryReq) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(deleteDiaryReq.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CommonRes>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${userSeq}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CommonRes.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CommonRes> amendDiary(userSeq, diaryModelReq) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(diaryModelReq.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CommonRes>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${userSeq}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CommonRes.fromJson(_result.data!);
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
