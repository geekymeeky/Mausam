import 'package:flutter/material.dart';
import 'package:mausam/components/reusable_card.dart';
import 'package:mausam/components/card_content.dart';
import 'package:mausam/utilities/constants.dart';

class WeatherView extends StatefulWidget {
  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
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
                'New York City, USA',
                style: kPlaceTextStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '19.2°C',
                    style: kTempTextStyle,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    child: Icon(
                      Icons.wb_sunny_rounded,
                      size: 150.0,
                      color: Colors.yellow,
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
                      value: '18 F',
                    ),
                  ),
                  ReusableCard(
                    width: 200.0,
                    height: 260.0,
                    cardChild: CardContent(
                        title: 'Wind speed',
                        icon: Icons.all_inclusive_rounded,
                        value: '26 kmph'),
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
                          value: 'Some Text'),
                      CardContent(
                        title: 'Humidity',
                        icon: Icons.water_damage_rounded,
                        value: 'Some Value',
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
