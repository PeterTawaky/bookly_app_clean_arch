import 'package:bookly_app/core/service/api/api_constants.dart';
import 'package:bookly_app/core/service/api/api_consumer.dart';
import 'package:bookly_app/core/service/api/api_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio = Dio();

  DioConsumer() {
    // control the dio
    dio.options.baseUrl = ApiConstants.googleBooks.baseUrl;
    dio.interceptors.add(ApiInterceptor()); //هيتنفذ مع كل request
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        },
      ),
    );
  }

  @override
  Future get(
    String path, {
    dynamic data,
    bool isFormData = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response response = await dio.get(
      path,
      queryParameters: queryParameters,
      data: isFormData ? FormData.fromMap(data) : data,
    );

    return response.data; //json data
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    final Response response = await dio.delete(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );

    return response.data; //json data
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    final Response response = await dio.post(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );

    return response.data; //json data
  }

  @override
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    final Response response = await dio.put(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );

    return response.data; //json data
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    final Response resopnse = await dio.patch(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );

    return resopnse.data; //json data
  }
}
