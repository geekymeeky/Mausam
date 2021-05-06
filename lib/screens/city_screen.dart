import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    Color gradient;
    var now = DateTime.now().hour;
    if (now >= 17) {
      gradient = Colors.purple;
    } else {
      gradient = Colors.blue;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a city'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [gradient, Colors.black54]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.location_city_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                hintText: 'Enter a city name',
              ),
              maxLines: 1,
              onChanged: (value) {
                cityName = value;
                print(cityName);
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, cityName);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                shape: CircleBorder(),
                minimumSize: Size(60.0, 100.0),
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
// TextButton(
// child: Text(
// 'Get weather',
// style: TextStyle(fontSize: 24, color: Colors.black54),
// ),
// onPressed: () {
// Navigator.pop(context, cityName);
// },
// )
