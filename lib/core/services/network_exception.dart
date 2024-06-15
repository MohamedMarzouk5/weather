import 'package:dio/dio.dart';
import 'package:weather/core/services/api_error_model.dart';

class NetworkException {
  factory NetworkException.errorHandler(DioException error) {
    if (error.response!.statusCode == 500) {
      throw const Failure(errMsg: "Server error");
    } else if (error.response!.statusCode == 401) {
      throw const Failure(errMsg: "Unauthorized");
    } else if (error.response!.statusCode == 404) {
      throw const Failure(errMsg: "City Not Found");
    } else {
      throw Failure(errMsg: error.response!.statusMessage.toString());
    }
  }
}
