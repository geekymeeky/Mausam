import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.width, this.height, this.cardChild});
  final double width;
  final double height;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0x42000000),
      ),
    );
  }
}
