class ApiConstants {
  ApiConstants._();
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';
  static const String iconUrl = 'http://www.openweathermap.org/img/wn';
  static const Duration receiveTimeout = Duration(seconds: 20);

  static const Duration connectionTimeout = Duration(seconds: 20);
}
