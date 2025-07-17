import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:with_prana_mobile_app/core/dependencies/getx_dependencies.dart';
import 'package:with_prana_mobile_app/core/route/routes.dart';

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
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'With Prana',
          theme: ThemeData(
            fontFamily: 'Sniglet',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: (settings) => getRoute(settings, context),
          builder:
              (context, child) => MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: TextScaler.noScaling),
                child: FlutterSmartDialog.init()(context, child),
              ),
        ),
      ),
    );
  }
}
