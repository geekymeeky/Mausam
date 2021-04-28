import 'package:flutter/material.dart';
import 'package:mausam/screens/loading_screen.dart';

void main() => runApp(Mausam());

class Mausam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
