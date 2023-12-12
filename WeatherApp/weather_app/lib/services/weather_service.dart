import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey;
  WeatherService(this.apiKey);

  Future<Weather> getWeather(String cityName) async {
    final response = await http
        .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // kullanıcıdan konum izni almak için
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // konumu bulmak için
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // bir konumu bir yer işaretileri listesine dönüştürmek için
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    // yer işaretlerinden şehir ismini ayıklamak için
    String? city = placemarks[0].locality;

    return city ?? "";
  }
}
