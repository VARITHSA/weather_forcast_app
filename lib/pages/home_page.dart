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
      appBar: AppBar(),
      body: FutureBuilder(
        future: client,
        builder: ((context, snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? Column(
                  children: [
                    Center(
                      child: Text(
                        "${snapshot.data!.sunrise}",
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    Center(
                      child: Text(
                        "${snapshot.data!.sunset}",
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    Center(
                      child: Text(
                        "${snapshot.data!.cityName}",
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: "Enter City Name",
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Temp",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Temp",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Temp",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Center(
                      child: Text(
                        "${snapshot.data!.temp}",
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
    );
  }
}
