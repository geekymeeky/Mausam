import 'package:flutter/material.dart';
import 'package:mausam/components/reusable_card.dart';
import 'package:mausam/components/card_content.dart';
import 'package:mausam/services/weather_model.dart';
import 'package:mausam/utilities/constants.dart';

class WeatherView extends StatefulWidget {
  WeatherView({this.locationWeather});

  final locationWeather;
  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  WeatherModel weatherModel = WeatherModel();
  dynamic temperature;
  dynamic feelsLike;
  dynamic pressure;
  dynamic humidity;
  dynamic windSpeed;
  dynamic countryName;
  dynamic cityName;
  dynamic weatherDescription;
  IconData weatherIcon;
  Color weatherIconColor;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        return;
      } else {
        temperature = weatherData['main']['temp'];
        feelsLike = weatherData['main']['feels_like'];
        pressure = weatherData['main']['pressure'];
        humidity = weatherData['main']['humidity'];
        windSpeed = weatherData['wind']['speed'];
        countryName = weatherData['sys']['country'];
        cityName = weatherData['name'];
        weatherDescription = weatherData['weather'][0]['description'];
        weatherIcon = weatherModel.getWeatherIcon(weatherData);
        weatherIconColor =
            weatherModel.getColor(weatherData['weather'][0]['id']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.black54]),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.my_location_rounded),
                  Icon(Icons.location_city_rounded)
                ],
              ),
              SizedBox(height: 40.0),
              Text(
                '$cityName, $countryName',
                style: kPlaceTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Column(
                    children: [
                      Text(
                        '$temperature°C',
                        style: kTempTextStyle,
                      ),
                      Text(
                        '$weatherDescription',
                        style: TextStyle(
                            fontFamily: 'ComicNeue light', fontSize: 20.0),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    child: Icon(
                      weatherIcon,
                      size: 150.0,
                      color: weatherIconColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ReusableCard(
                    width: 200.0,
                    height: 260.0,
                    cardChild: CardContent(
                      title: 'Feels like',
                      icon: Icons.thermostat_rounded,
                      value: '$feelsLike °C',
                    ),
                  ),
                  ReusableCard(
                    width: 200.0,
                    height: 260.0,
                    cardChild: CardContent(
                        title: 'Wind speed',
                        icon: Icons.all_inclusive_rounded,
                        value: '$windSpeed kmph'),
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ReusableCard(
                  width: double.infinity,
                  height: 160.0,
                  cardChild: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CardContent(
                          title: 'Pressure',
                          icon: Icons.compress,
                          value: '$pressure mb'),
                      CardContent(
                        title: 'Humidity',
                        icon: Icons.water_damage_rounded,
                        value: '$humidity %',
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
