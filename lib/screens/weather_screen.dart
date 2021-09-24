import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WeatherScreen extends StatefulWidget {
  String cityName;
  int temp;
  WeatherScreen(this.temp, this.cityName, {Key? key}) : super(key: key);
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
            widget.cityName,
            style: const TextStyle(
              fontSize: 40.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            '${widget.temp}',
            style: const TextStyle(
              fontSize: 60.0,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
