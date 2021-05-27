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
        primaryColor: Colors.deepPurple,
        accentColor: Color(0xFFDDCDFA),
      ),
      home: HomeScreen(),
    );
  }
}
