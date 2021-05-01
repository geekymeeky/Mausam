import 'package:flutter/material.dart';
import 'package:mausam/services/weather_model.dart';
import 'package:mausam/screens/weather_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  void getWeatherData() async {
    WeatherModel model = WeatherModel();
    var weatherData = await model.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherView(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SpinKitDoubleBounce(
        size: 100.0,
        color: Colors.blueAccent,
      ),
    );
  }
}
