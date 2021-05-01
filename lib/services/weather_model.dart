import 'package:mausam/services/location.dart';
import 'package:mausam/services/networking.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

const API_KEY = 'SECRET_API_KEY';
const API_URI = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Locator location = Locator();
    await location.getCurrentLocation();

    NetworkHandler networkHelper = NetworkHandler(Uri.parse(
        '$API_URI?lat=${location.latitude}&lon=${location.longitude}&appid=$API_KEY&units=metric'));

    var _weatherData = await networkHelper.getData();
    return _weatherData;
  }

  IconData getWeatherIcon(dynamic weatherData) {
    var id = weatherData['weather'][0]['id'];
    if (id < 300) {
      return FontAwesomeIcons.cloudShowersHeavy;
    } else if (id < 400) {
      return FontAwesomeIcons.cloudRain;
    } else if (id < 600) {
      return FontAwesomeIcons.cloudShowersHeavy;
    } else if (id < 700) {
      return FontAwesomeIcons.snowflake;
    } else if (id < 800) {
      if (id == 721) {
        return FontAwesomeIcons.cloudSun;
      }
      return FontAwesomeIcons.smog;
    } else if (id == 800) {
      return FontAwesomeIcons.sun;
    } else {
      return FontAwesomeIcons.cloudSun;
    }
  }

  Color getColor(int id) {
    if (id < 600) {
      return Colors.white70;
    } else if (id < 700) {
      return Colors.white;
    } else if (id < 800) {
      return Colors.white;
    } else {
      return Colors.orangeAccent;
    }
  }
}
