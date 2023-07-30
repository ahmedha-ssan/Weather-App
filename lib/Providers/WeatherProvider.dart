import 'package:flutter/material.dart';
import 'package:my_weatherapp/models/WeatherModel.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;

  //set weatheData(WeatherModel weatheData) {}
  String? cityName;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
