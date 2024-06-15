import 'package:flutter/material.dart';
import 'package:weather/core/theming/styles.dart';
import 'package:weather/featuers/home/ui/search.dart';
import 'package:weather/featuers/home/ui/widgets/weather_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Weather',
          style: AppStyles.styleMedium30(context),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: const WeatherBody(),
    );
  }
}
