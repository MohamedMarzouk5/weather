import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:weather/core/services/api_error_model.dart';
import 'package:weather/featuers/home/data/models/weather.dart';
import 'package:weather/featuers/home/repo/weather_repo.dart';

import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherState.initial());
  WeatherRepository weatherRepository = WeatherRepository();

  Future<void> fetchWeather(String city) async {
    emit(state.copyWith(status: WeatherStatus.loading));
    if (await weatherRepository.hasInternetConnection()) {
      emit(state.copyWith(
        status: WeatherStatus.error,
        error: const Failure(errMsg: 'No Internet Connection'),
      ));
    } else {
      try {
        final Weather weather = await weatherRepository.getWeatherByCity(city);
        emit(state.copyWith(
          status: WeatherStatus.loaded,
          weather: weather,
        ));
        print('state: $state');
      } on Failure catch (error) {
        print('state: $state');
        emit(state.copyWith(
          status: WeatherStatus.error,
          error: error,
        ));
      }
    }
  }
}
