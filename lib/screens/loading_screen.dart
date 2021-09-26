import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:weatherapp/constants/secrets.dart';
import 'package:weatherapp/screens/weather_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      getData(position.latitude, position.longitude);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getData(var lat, var lon) async {
    var url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      var temperature = convert.jsonDecode(data)['main']['temp'];
      var cityName = convert.jsonDecode(data)['name'];
      print(cityName);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => WeatherScreen(temperature, cityName)),
          (route) => false);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
