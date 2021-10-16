import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:revolution/screens/home_screen.dart';
import 'package:revolution/screens/login_screen.dart';
import 'package:revolution/screens/registration_screen.dart';
import 'package:revolution/screens/search_screen.dart';

void main() async {
  await init();
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
      initialRoute: 'login_screen',
      routes: {
        'login_screen': (context) => LoginScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'home_screen': (context) => HomeScreen(),
        'search_screen': (context) => SearchScreen(),
      },
    );
  }

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
}
