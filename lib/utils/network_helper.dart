import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_forcast_app/utils/json_data.dart';

class NetWorkHelper {
  final String url;

  NetWorkHelper(this.url);

  Future<WeatherData> getWeatherData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
       
        return WeatherData.fromJson(jsonDecode(response.body));
      } else {
        print('Error: ${response.statusCode}');
        return WeatherData();
      }
    } catch (e) {
      return WeatherData();
    }
  }
}
