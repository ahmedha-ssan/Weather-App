import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_weatherapp/models/WeatherModel.dart';
import 'package:my_weatherapp/pages/searchPage.dart';
import 'package:provider/provider.dart';

import '../Providers/WeatherProvider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUI() {
    setState(() {
      //updateUI()
    });
  }

  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return search(
                  updateUI: updateUI,
                );
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'There is no weather 😔 start',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  'searching now 🔍',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ))
          : Container(
              //color: weatherData!.getThemeColor(),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  weatherData!.getThemeColor(),
                  weatherData!.getThemeColor()[50]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 4,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'updated at :${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        //weatherData!.temp.toInt().toString(),
                        '${weatherData!.maxTemp.toInt()}',
                        style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text('maxTemp :${weatherData!.maxTemp.toInt()}'),
                          Text('minTemp :${weatherData!.minTemp.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    weatherData?.waetherStateName ?? '',
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
    );
  }
}
