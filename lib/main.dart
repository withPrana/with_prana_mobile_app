import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/view/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'With Prana', home: SplashScreen());
  }
}
