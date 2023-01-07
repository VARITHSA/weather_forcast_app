import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_forcast_app/utils/json_data.dart';

class NetWorkHelper {
  final String url;

  NetWorkHelper(
    this.url,
  );
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return WeatherData.fromJson(data);
    } else {
      print(response.statusCode);
    }
  }
}
