import 'package:flutter/material.dart';
import 'package:mausam/screens/weather_view.dart';

void main() => runApp(Mausam());

class Mausam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: WeatherView(),
    );
  }
}
