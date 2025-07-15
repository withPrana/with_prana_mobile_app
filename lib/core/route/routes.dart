import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/view/screens/initial_question_screen_one.dart';
import 'package:with_prana_mobile_app/view/screens/name_entry_screen.dart';
import 'package:with_prana_mobile_app/view/screens/splash_screen.dart';

Map<String, Widget Function(BuildContext context)> routes(
  BuildContext context,
) {
  // final args = ModalRoute.of(context)!.settings.arguments;
  return {
    SplashScreen.routepath: (context) => SplashScreen(),
    NameEntryScreen.routePath: (context) => NameEntryScreen(),
  };
}

Route getRoute(RouteSettings settings, BuildContext context) {
  switch (settings.name) {
    case SplashScreen.routepath:
      return _buildRoute(SplashScreen(), settings);
    case NameEntryScreen.routePath:
      return _buildRoute(NameEntryScreen(), settings);
    case InitialQuestionScreenOne.routePath:
      return _buildRoute(InitialQuestionScreenOne(), settings);
    default:
      return _buildRoute(const SplashScreen(), settings);
  }
}

PageRouteBuilder _buildRoute(Widget page, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) {
      return page;
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
