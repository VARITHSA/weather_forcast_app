import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_forcast_app/utils/network_helper.dart';

const api = 'e27fd40294c9e10efeeaf71a4761ef30';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

double? lat;
double? long;

Future<void> getLocationData() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  lat = position.latitude;
  long = position.longitude;
  print(lat);
  print(long);
  NetWorkHelper netWorkHelper = NetWorkHelper(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$api');
  var weatherData = await netWorkHelper.getData();
}

@override
void initState() {
  getLocationData();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            child: const Text('l'),
            onPressed: () {
              // getlocation();
            }),
      ),
    );
  }
}
