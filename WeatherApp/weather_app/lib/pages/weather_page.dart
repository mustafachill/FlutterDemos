import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

const myTextStyle = GoogleFonts.bebasNeue;

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // Apikey
  final _weatherService = WeatherService('b86a00400a133db51e7e30e962123b3b');
  Weather? _weather;

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
    if (mainCondition == null) return 'assets/weather_like.json';

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
      case 'thunderstorm':
        return 'assets/weather_like.json';
      case 'clear':
        return 'assets/sunny.json';
      case 'snow':
        return 'snowy.json';
      default:
        return 'assets/weather_like.json';
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
    double widthSize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //city name
            Container(
              padding: EdgeInsets.all(widthSize * 0.1),
              child: Column(
                children: [
                  Icon(
                    Icons.location_on,
                    size: widthSize * 0.1,
                  ),
                  Text(
                    _weather?.cityName ?? "Loading city...",
                    style: myTextStyle(
                      fontSize: widthSize * 0.1,
                      //fontFamily: 'BebasNeue'
                    ),
                  ),
                ],
              ),
            ),

            // animation

            Container(
              padding: EdgeInsets.all(widthSize * 0.1),
              child: Column(
                children: [
                  Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
                ],
              ),
            ),

            //temperature
            Container(
              padding: EdgeInsets.all(widthSize * 0.1),
              child: Column(
                children: [
                  Text(
                    '${_weather?.temperature.round()}°C',
                    style: myTextStyle(fontSize: widthSize * 0.1),
                  ),

                  //weather condition
                  Text(
                    _weather?.mainCondition ?? "",
                    style: myTextStyle(fontSize: widthSize * 0.05),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
