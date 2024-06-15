import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/core/services/api_error_model.dart';

import 'package:weather/core/services/weather_api_services.dart';
import 'package:weather/featuers/home/data/models/weather.dart';

class WeatherRepository {
  WeatherApiServices weatherApiServices = WeatherApiServices();
  late final List<ConnectivityResult> connectivityResult;

  Future<Weather> getWeatherByCity(String city) async {
    try {
      final result = await weatherApiServices.get(
        apiKey: dotenv.env['APPID']!,
        queryParameters: {
          'q': city,
          'appid': dotenv.env['APPID'],
        },
      );
      Weather weather = Weather.fromMap(result.data);
      return weather;
    } on Failure {
      rethrow;
    }
  }

  Future<bool> hasInternetConnection() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    return !connectivityResult.contains(ConnectivityResult.mobile) &&
        !connectivityResult.contains(ConnectivityResult.wifi);
  }
}
