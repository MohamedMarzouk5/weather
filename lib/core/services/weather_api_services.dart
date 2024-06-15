import 'dart:io';

import 'package:dio/dio.dart';

import 'package:weather/core/services/api_constants.dart';
import 'package:weather/core/services/api_error_model.dart';
import 'package:weather/core/services/network_exception.dart';

class WeatherApiServices {
  static final Dio _dio = Dio();

  WeatherApiServices() {
    _dio
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = ApiConstants.connectionTimeout
      ..options.receiveTimeout = ApiConstants.receiveTimeout
      ..options.responseType = ResponseType.json
      ..interceptors.add(LogInterceptor(
        request: false,
        requestHeader: false,
        requestBody: true,
        responseHeader: false,
        responseBody: false,
        error: true,
      ));
  }

// Get
  Future<Response<dynamic>> get(
      {String? url,
      Map<String, dynamic>? queryParameters,
      Options? options,
      ProgressCallback? onReceiveProgress,
      Map<String, String>? headers,
      required String apiKey}) async {
    try {
      final Response response = await _dio.get(
        url ?? ApiConstants.baseUrl,
        queryParameters: queryParameters,
        options: Options(
          headers: headers ??
              {
                'Authorization': "Bearer $apiKey",
              },
        ),
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (error) {
      throw NetworkException.errorHandler(error);
    } on SocketException {
      throw const Failure(errMsg: "No Internet connect");
    } on FormatException {
      throw const Failure(errMsg: "Format Exception");
    } on Error catch (e) {
      throw Failure(errMsg: "Error $e");
    }
  }
}
