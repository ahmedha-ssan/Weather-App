import 'package:flutter/material.dart';
import 'package:my_weatherapp/models/WeatherModel.dart';
import 'package:my_weatherapp/pages/home.dart';
import 'package:provider/provider.dart';

import 'Providers/WeatherProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherModel? wether;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<WeatherProvider>(context)
                .weatherData!
                .getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
