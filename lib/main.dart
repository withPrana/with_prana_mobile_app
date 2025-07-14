import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/core/dependencies/getx_dependencies.dart';
import 'package:with_prana_mobile_app/view/screens/splash_screen.dart';

void main() {
  setupGetxDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'With Prana',
        theme: ThemeData(
          fontFamily: 'Sniglet',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
        builder:
            (context, child) => MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.noScaling),
              child: child!,
            ),
      ),
    );
  }
}
