import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../const/api_routes.dart';
import '../../const/constants.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String acceptLanguage = "Accept-Language";
const String authorization = "authorization";

class DioFactory {
  DioFactory();

  Dio dio = Dio();

  Future<Dio> getDio() async {
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      // AUTHORIZATION: token!,
    };

    dio.options = BaseOptions(
        baseUrl: AppUrls.baseUrl,
        headers: headers,
        receiveTimeout: const Duration(seconds: Constants.apiTimeOut),
        sendTimeout: const Duration(seconds: Constants.apiTimeOut));

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ));
    }
    // interceptAccessToken();
    return dio;
  }

  void interceptAccessToken() {
    dio.interceptors.add(AccessTokenInterceptor());
  }
}

class AccessTokenInterceptor extends Interceptor {
  AccessTokenInterceptor();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // String? userToken = di<AppPreferences>()
    //     .getStorage<String?>(AppPreferences.accessTokenKey);
    //
    // if (userToken != null) {
    //   options.headers[authorization] = "Bearer $userToken";
    // }
    return handler.next(options);
  }
}

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int retries;
  final Duration retryDelay;

  RetryInterceptor({
    required this.dio,
    this.retries = 3,
    this.retryDelay = const Duration(seconds: 2),
  });

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    int attempt = 0;

    while (attempt < retries) {
      attempt++;
      await Future.delayed(retryDelay);
      try {
        return await dio.request(
          err.requestOptions.path,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
          ),
          data: err.requestOptions.data,
          queryParameters: err.requestOptions.queryParameters,
        );
      } catch (e) {
        if (attempt >= retries) {
          return super.onError(err, handler);
        }
      }
    }
  }
}
