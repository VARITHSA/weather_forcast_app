import 'package:weather_forcast_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class WeatherData {
  var cityName;
  var minTemp;
  var maxTemp;
  var pressure;
  var description;
  var winSpeevar;
  var latitude;
  var longitude;
  var temp;
  WeatherData({
     this.cityName,
     this.minTemp,
     this.maxTemp,
     this.pressure,
     this.description,
     this.winSpeevar,
     this.latitude,
     this.longitude,
     this.temp,
  });
  WeatherData.fromJson(Map<String, dynamic> json) {
    longitude = json['coord']['lon'];
    latitude = json['coord']['lat'];
    temp = json['main']['temp'];
    minTemp = json['main']['temp_min'];
    maxTemp = json['main']['temp_max'];
    pressure = json['main']['pressure'];
    cityName = json['name'];
  }
}
