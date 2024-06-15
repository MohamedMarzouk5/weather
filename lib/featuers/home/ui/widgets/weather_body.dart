import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/services/api_constants.dart';
import 'package:weather/core/theming/styles.dart';
import 'package:weather/featuers/home/cubits/weather_cubit.dart';
import 'package:weather/featuers/home/cubits/weather_state.dart';
import 'package:weather/featuers/home/ui/widgets/error_dialog.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state.status == WeatherStatus.error) {
          errorDialog(context, state.error.errMsg);
        }
      },
      builder: (context, state) {
        if (state.status == WeatherStatus.initial) {
          return Center(
            child: Text(
              'Search for weather',
              style: AppStyles.styleBold15(context),
            ),
          );
        }

        if (state.status == WeatherStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // weather details
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              Text(state.weather.name,
                  textAlign: TextAlign.center,
                  style: AppStyles.styleMedium30(context)),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${(state.weather.temp - 273.15).toStringAsFixed(2)} ℃',
                    style: AppStyles.styleMedium30(context),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                          'max: ${(state.weather.maxTemp - 273.15).toStringAsFixed(2)} ℃',
                          style: AppStyles.styleReg20(context)),
                      Text(
                          'mini: ${(state.weather.miniTemp - 273.15).toStringAsFixed(2)} ℃',
                          style: AppStyles.styleReg20(context)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Text(
                '${toFahrenheit(state.weather.temp)} ℉',
                style: AppStyles.styleMedium30(context),
              ),
              const SizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Spacer(),
                  FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif',
                    image:
                        '${ApiConstants.iconUrl}/${state.weather.icon}@4x.png',
                    width: 96,
                    height: 96,
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      state.weather.description,
                      style: AppStyles.styleMedium30(context),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String toFahrenheit(num temp) =>
      ((temp - 273.15) * (9 / 5) + 32).toDouble().toStringAsFixed(2);
}
