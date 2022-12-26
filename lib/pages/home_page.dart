import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

const api = 'e27fd40294c9e10efeeaf71a4761ef30';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

double? lat;
double? long;

Future<void> getlocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  lat = position.latitude;
  long = position.longitude;
}

void getData() async {
  Response response = get('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=$api');
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    getlocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            child: const Text('Click'),
            onPressed: () {
              // getlocation();
            }),
      ),
    );
  }
}
