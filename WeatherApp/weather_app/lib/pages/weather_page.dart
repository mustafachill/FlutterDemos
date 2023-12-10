import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // Apikey
  final _weatherService = WeatherService('b86a00400a133db51e7e30e962123b3b');
  Weather? _weather;
  getWeather() {
    return _weather?.cityName;
  }

  // Fetch weather
  _fetchWeather() async {
    // geçerli şehri bul
    String cityName = await _weatherService.getCurrentCity();
    // şehir için geçerli hava durumunu bul
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/sunny.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/sunny.json';
      case 'thunderstorm':
        return 'assets/sunny.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  // init state
  @override
  void initState() {
    super.initState();

    //fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //city name
            //Text(_weather?.cityName ?? "Loading city..."),

            // animation
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

            //temperature
            Text(/*${_weather?.temperature.round()}*/ '°C'),

            //weather condition
            Text(_weather?.mainCondition ?? ""),
          ],
        ),
      ),
    );
  }
}
