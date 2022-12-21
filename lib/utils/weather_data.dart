import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_forcast_app/utils/weather_model.dart';

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=639757cd6340442498940007221112&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
