import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

String apikey = 'febe34cc5cea1583bfad729ed0e5188a';
const String weatherUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getWeatherCity(String cityname) {
    NetworkHelper networkhelp =
        NetworkHelper("$weatherUrl?q=$cityname&appid=$apikey&units=metrics");
    var getdata = networkhelp.getData();
    return getdata;
  }

  Future<dynamic> getlocationWeather() async {
    Location location = Location();
    await location.getCurrentlocation();
    NetworkHelper network = NetworkHelper(
        '$weatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');
    var netwrokdata = await network.getData();
    return netwrokdata;
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
