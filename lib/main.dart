import 'package:flutter/material.dart';
import 'package:revolution/screens/home_screen.dart';

void main() {
  runApp(MyApp());
  //A5E6F3
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revolution',
      theme: ThemeData(
        primaryColor: Color(0xFF007390),
        accentColor: Color(0xFFEDFAFD),
      ),
      home: HomeScreen(),
    );
  }
}
