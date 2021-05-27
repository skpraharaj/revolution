import 'package:flutter/material.dart';
import 'package:revolution/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revolution',
      theme: ThemeData(
        primaryColor: Color(0xFF800020),
        accentColor: Color(0xFFF5F5F5),
      ),
      home: HomeScreen(),
    );
  }
}
