import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double minTemp;
  double maxTemp;
  String waetherStateName;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.waetherStateName,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        minTemp: jsonData['mintemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        waetherStateName: jsonData['condition']['text']);
  }

  //get weatherData => null;
  // @override
  // String toString() {
  //   return 'date=$date temp = $temp minTemp=$minTemp maxTemp=$maxTemp waetherStateName=$waetherStateName';
  // }
  String getImage() {
    if (waetherStateName == 'Sunny' ||
        waetherStateName == 'Clear' ||
        waetherStateName == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (waetherStateName == 'Blizzard' ||
        waetherStateName == 'Patchy snow possible' ||
        waetherStateName == 'Patchy sleet possible' ||
        waetherStateName == 'Patchy freezing drizzle possible' ||
        waetherStateName == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (waetherStateName == 'Freezing fog' ||
        waetherStateName == 'Fog' ||
        waetherStateName == 'Heavy Cloud' ||
        waetherStateName == 'Mist' ||
        waetherStateName == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (waetherStateName == 'Patchy rain possible' ||
        waetherStateName == 'Heavy Rain' ||
        waetherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (waetherStateName == 'Thundery outbreaks possible' ||
        waetherStateName == 'Moderate or heavy snow with thunder' ||
        waetherStateName == 'Patchy light snow with thunder' ||
        waetherStateName == 'Moderate or heavy rain with thunder' ||
        waetherStateName == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (waetherStateName == 'Sunny' ||
        waetherStateName == 'Clear' ||
        waetherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if (waetherStateName == 'Blizzard' ||
        waetherStateName == 'Patchy snow possible' ||
        waetherStateName == 'Patchy sleet possible' ||
        waetherStateName == 'Patchy freezing drizzle possible' ||
        waetherStateName == 'Blowing snow') {
      return Colors.blue;
    } else if (waetherStateName == 'Freezing fog' ||
        waetherStateName == 'Fog' ||
        waetherStateName == 'Heavy Cloud' ||
        waetherStateName == 'Mist' ||
        waetherStateName == 'Fog') {
      return Colors.blueGrey;
    } else if (waetherStateName == 'Patchy rain possible' ||
        waetherStateName == 'Heavy Rain' ||
        waetherStateName == 'Showers	') {
      return Colors.blue;
    } else if (waetherStateName == 'Thundery outbreaks possible' ||
        waetherStateName == 'Moderate or heavy snow with thunder' ||
        waetherStateName == 'Patchy light snow with thunder' ||
        waetherStateName == 'Moderate or heavy rain with thunder' ||
        waetherStateName == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
