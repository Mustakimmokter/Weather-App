import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weathe_app/constants.dart';
import 'package:weathe_app/icon_button.dart';
import 'package:weathe_app/screens/city_screen.dart';
import 'package:weathe_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  static const String pageRoute = 'locationPage';
  final weatherData;
  LocationScreen({Key? key, this.weatherData}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int? temperature;
  String? weatherIcon;
  String? cityName;
  String? weatherMassage;

  @override
  void initState() {
    super.initState();
    updateUi(widget.weatherData);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      weatherMassage = weatherModel.getMessage(temperature!);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:
            const EdgeInsets.only(left: 12, right: 12, bottom: 16, top: 32),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/waterfall_1.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  color: Colors.white,
                  iconData: FontAwesomeIcons.locationArrow,
                  onPressed: () {
                    updateUi(widget.weatherData);
                  },
                ),
                CustomIconButton(
                  color: Colors.white,
                  iconData: FontAwesomeIcons.city,
                  onPressed: () async {
                    var weatherData = await Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CityScreen()));
                    if (cityName != null) {
                      var weather =
                          await weatherModel.getCityLocation(weatherData);
                      updateUi(weather);
                    }
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$temperature°', style: kTextStyle2),
                Text(
                  '$weatherIcon',
                  style: TextStyle(fontSize: 60),
                ),
              ],
            ),
            Text(
              '$weatherMassage in $cityName',
              textAlign: TextAlign.right,
              style: kTextStyle1,
            ),
          ],
        ),
      ),
    );
  }
}
