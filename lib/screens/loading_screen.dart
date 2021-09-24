import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:weatherapp/constants/secrets.dart';

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
      print(position.latitude);
      print(position.longitude);
    } catch (e) {
      print(e);
    }
  }

  Future<void> getData() async {
    var url = Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=$apiKey');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      var condition = convert.jsonDecode(data)['weather'][0]['id'];
      var temperature = convert.jsonDecode(data)['main']['temp'];
      var cityName = convert.jsonDecode(data)['name'];
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
