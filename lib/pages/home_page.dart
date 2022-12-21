import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String lat;
  late String long;
  String locationMessage = 'Current location of the user';
  Future<Position> _getPosition() async {
    bool services;
    LocationPermission permission;
    services = await Geolocator.isLocationServiceEnabled();
    if (!services) {
      return Future.error("Location services are disabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied");
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    _getPosition().then((value) {
      lat = '${value.latitude}';
      long = '${value.longitude}';
      setState(() {
        locationMessage = 'Latitde is $lat, longitude is $long';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/redweather.png',
              fit: BoxFit.fitHeight,
            ),
            Positioned(
              top: 250,
              child: Center(
                child: Text(locationMessage),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
