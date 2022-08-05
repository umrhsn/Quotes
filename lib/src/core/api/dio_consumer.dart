import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quotes/src/core/api/api_consumer.dart';
import 'package:quotes/src/core/api/app_interceptors.dart';
import 'package:quotes/src/core/api/endpoint.dart';
import 'package:quotes/src/core/api/status_code.dart';
import 'package:quotes/injection_container.dart' as di;

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    /// Dio concatenates endpoints easily on a base url
    client.options
      ..baseUrl = Endpoint.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) => status! < StatusCode.internalServerError;

    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await client.get(path, queryParameters: queryParameters);
    return _handleResponseAsJson(response);
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    final response = await client.post(path, queryParameters: queryParameters, data: body);
    return _handleResponseAsJson(response);
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async {
    final response = await client.post(path, queryParameters: queryParameters, data: body);
    return _handleResponseAsJson(response);
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }
}
