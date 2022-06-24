import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weathe_app/screens/location_screen.dart';
import 'package:weathe_app/services/weather.dart';

const apiKey = 'b43a7106ee1a942d4cf794802ae6f20c';
const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

class HomePage extends StatefulWidget {
  static const String pageRoute = 'homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getGeolocatorPermission();
    weather();
  }

  void weather() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => LocationScreen(
                  weatherData: weatherData,
                )));
  }

  Future<Position> getGeolocatorPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location not available');
      }
    } else {
      throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
