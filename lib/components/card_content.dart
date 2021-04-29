import 'package:flutter/material.dart';
import '../utilities/constants.dart';

class CardContent extends StatelessWidget {
  CardContent({this.title, this.icon, this.value});
  final String title;
  final IconData icon;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          title,
          style: kCardContentTitleStyle,
        ),
        Icon(
          icon,
          size: 50,
        ),
        Text(
          value,
          style: kCardContentStyle,
        ),
      ],
    );
  }
}
