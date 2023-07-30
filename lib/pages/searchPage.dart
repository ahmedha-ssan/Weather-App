import 'package:flutter/material.dart';
import 'package:my_weatherapp/models/WeatherModel.dart';
import 'package:my_weatherapp/servicesLOGIC/weatherServices.dart';
import 'package:provider/provider.dart';

import '../Providers/WeatherProvider.dart';

class search extends StatelessWidget {
  String? cityName;
  search({this.updateUI});
  VoidCallback? updateUI;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search a city')),
      body: Center(
        child: TextField(
          onChanged: (data) {
            cityName = data;
          },
          onSubmitted: (data) async {
            cityName = data;
            WeatherServices services = WeatherServices();
            WeatherModel weather =
                await services.getWeather(cityName: cityName!);
            Provider.of<WeatherProvider>(context, listen: false).weatherData =
                weather;
            Provider.of<WeatherProvider>(context, listen: false).cityName =
                cityName;
            //updateUI!();
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            hintText: 'Enter a city',
            border: OutlineInputBorder(),
            suffixIcon: GestureDetector(
                child: Icon(Icons.search),
                onTap: () async {
                  WeatherServices services = WeatherServices();
                  WeatherModel weather =
                      await services.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;
                  //updateUI!();
                  Navigator.pop(context);
                }),
            label: Text('Search'),
            contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          ),
        ),
      ),
    );
  }
}
