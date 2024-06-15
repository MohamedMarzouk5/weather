import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/theming/styles.dart';
import 'package:weather/featuers/home/cubits/weather_cubit.dart';
import 'package:weather/featuers/home/ui/widgets/custom_text_form_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search'),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(height: 60.0),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomTextFormField(
                  labelText: 'City name',
                  hintText: 'Search for city',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter city name';
                    }
                    return null;
                  },
                  onSaved: (cityName) {
                    city = cityName;
                  },
                )),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<WeatherCubit>(context).fetchWeather(city!);
                  Navigator.pop(context);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              child: Text("Show Weather",
                  style: AppStyles.styleBold15(context)
                      .copyWith(color: Colors.purple)),
            ),
          ],
        ),
      ),
    );
  }
}
