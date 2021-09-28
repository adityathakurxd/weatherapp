import 'package:flutter/material.dart';
import 'package:weatherapp/models/weathermodel.dart';

// ignore: must_be_immutable
class WeatherScreen extends StatefulWidget {
  WeatherApi weatherApi;
  WeatherScreen({Key? key, required this.weatherApi}) : super(key: key);
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
          ),
          Text(
            widget.weatherApi.name,
            style: const TextStyle(
              fontSize: 40.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            widget.weatherApi.weather[0].description,
            //
            style: const TextStyle(
              fontSize: 60.0,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
