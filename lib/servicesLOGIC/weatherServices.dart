import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/WeatherModel.dart';

class WeatherServices {
  String baseURL = 'http://api.weatherapi.com/v1';
  String apiKEY = '3677bed892474b30b7a122242220806';

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseURL/forecast.json?key=$apiKEY&q=$cityName&days=7');
    http.Response response = await http.get(url);
    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception();
    }
    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
