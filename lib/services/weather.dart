import 'package:weathe_app/services/location.dart';
import 'package:weathe_app/services/network.dart';

const apiKey = 'b43a7106ee1a942d4cf794802ae6f20c';
const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityLocation(String cityName) async {
    NetWorkHelper netWorkHelper =
        NetWorkHelper(url: '$baseUrl?q=$cityName&appid=$apiKey&units=metric');
    var weather = await netWorkHelper.getWeather();
    return weather;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    NetWorkHelper netWorkHelper = NetWorkHelper(
        url:
            '$baseUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weather = await netWorkHelper.getWeather();
    return weather;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
