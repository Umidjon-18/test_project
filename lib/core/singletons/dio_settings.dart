import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:test_project/assets/constants/app_constants.dart';

typedef ConverterFunctionType<T> = T Function(dynamic response);

class DioSettings {
  BaseOptions _dioBaseOptions({required String? baseUrl}) => BaseOptions(
        baseUrl: baseUrl ?? AppConstants.BASE_URL,
        connectTimeout: const Duration(milliseconds: 35000),
        receiveTimeout: const Duration(milliseconds: 35000),
        followRedirects: false,
        headers: <String, dynamic>{},
        validateStatus: (status) => status != null && status <= 500,
      );

  void setBaseOptions({String? lang, String? baseUrl}) => BaseOptions(
        baseUrl: baseUrl ?? AppConstants.BASE_URL,
        connectTimeout: const Duration(milliseconds: 35000),
        receiveTimeout: const Duration(milliseconds: 35000),
        headers: <String, dynamic>{'Accept-Language': lang},
        followRedirects: false,
        validateStatus: (status) => status != null && status <= 500,
      );

  Dio dio({String? baseUrl}) {
    final dio = Dio(_dioBaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        request: true,
        requestHeader: true,
        logPrint: (object) => log(object.toString())));
    return dio;
  }
}
