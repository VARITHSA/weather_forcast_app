import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_forcast_app/utils/json_data.dart';
import 'package:weather_forcast_app/utils/network_helper.dart';

const api = 'e27fd40294c9e10efeeaf71a4761ef30';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var suntime;
  late final Future<WeatherData> client;
  double? lat;
  double? long;

  Future<WeatherData> getLocationData() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // lat = position.latitude;
    // long = position.longitude;
    // print(lat);
    // print(long);

    NetWorkHelper netWorkHelper = NetWorkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$api&units=metric');
    return await netWorkHelper.getWeatherData();
  }

  @override
  void initState() {
    super.initState();
    client = getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.cyan.shade200,
      body: FutureBuilder(
        future: client,
        builder: ((context, snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Temperature: ${snapshot.data!.temp}°c',
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    Center(
                      child: Text(
                        'City: ${snapshot.data!.cityName}',
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Min Temperature: ${snapshot.data!.minTemp}°c',
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    Center(
                      child: Text(
                        ' Max Temperature: ${snapshot.data!.maxTemp}°c',
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    Center(
                      child: Text(
                        'description: ${snapshot.data!.description}',
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    Center(
                      child: Text(
                        'description: ${snapshot.data!.description}',
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        }),
      ),
      drawer: const Drawer(),
    );
  }
}
