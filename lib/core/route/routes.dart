import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/view/screens/bottom_navigation_screens/bottom_navigation_screen.dart';
import 'package:with_prana_mobile_app/view/screens/bottom_navigation_screens/home_screen.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/initial_question_screen_one.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/initial_question_screen_two.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/mail_entry_screen.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/name_entry_screen.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/otp_verification_screen.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/splash_screen.dart';
import 'package:with_prana_mobile_app/view/screens/profile_screens/account_info_screen.dart';
import 'package:with_prana_mobile_app/view/screens/profile_screens/subscription_status_screen.dart';

Route getRoute(RouteSettings settings, BuildContext context) {
  switch (settings.name) {
    ////
    case SplashScreen.routePath:
      return _buildRouteWithDefaultAnimation(SplashScreen(), settings);
    ////
    case NameEntryScreen.routePath:
      return _buildRouteWithDefaultAnimation(NameEntryScreen(), settings);
    case InitialQuestionScreenOne.routePath:
      ////
      return _buildRouteWithDefaultAnimation(
        InitialQuestionScreenOne(),
        settings,
      );
    ////
    case InitialQuestionScreenTwo.routePath:
      return _buildRouteWithDefaultAnimation(
        InitialQuestionScreenTwo(),
        settings,
      );
    ////
    case MailEntryScreen.routePath:
      return _buildRouteWithDefaultAnimation(MailEntryScreen(), settings);
    ////
    case OtpVerificationScreen.routePath:
      return _buildRouteWithDefaultAnimation(OtpVerificationScreen(), settings);
    ////
    case BottomNavigationScreen.routePath:
      return _buildRouteWithDefaultAnimation(
        BottomNavigationScreen(),
        settings,
      );
    ////
    case HomeScreen.routePath:
      return _buildRouteWithDefaultAnimation(HomeScreen(), settings);
    ////
    case SubscriptionStatusScreen.routePath:
      return _buildRouteWithDefaultAnimation(
        SubscriptionStatusScreen(),
        settings,
      );
    case AccountInfoScreen.routePath:
      return _buildRouteWithDefaultAnimation(AccountInfoScreen(), settings);
    ////
    default:
      return _buildRouteWithDefaultAnimation(SplashScreen(), settings);
  }
}

// PageRouteBuilder _buildRouteWithSlideAnimation(
//   Widget page,
//   RouteSettings settings,
// ) {
//   return PageRouteBuilder(
//     settings: settings,
//     pageBuilder: (context, animation, secondaryAnimation) {
//       return page;
//     },
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(1.0, 0.0);
//       const end = Offset.zero;
//       const curve = Curves.easeInOut;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//       var offsetAnimation = animation.drive(tween);

//       return SlideTransition(position: offsetAnimation, child: child);
//     },
//   );
// }

Route _buildRouteWithDefaultAnimation(Widget page, RouteSettings settings) {
  if (Platform.isAndroid) {
    return MaterialPageRoute(settings: settings, builder: (context) => page);
  } else {
    return CupertinoPageRoute(settings: settings, builder: (context) => page);
  }
}

// Route _buildRouteWithFadeAnimation(Widget page, RouteSettings settings) {
//   return PageRouteBuilder(
//     settings: settings,
//     pageBuilder: (context, animation, secondaryAnimation) => page,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return FadeTransition(
//         opacity: animation,
//         child: child,
//       );
//     },
//   );
// }
