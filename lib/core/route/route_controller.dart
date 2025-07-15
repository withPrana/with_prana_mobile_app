import 'package:flutter/cupertino.dart';

class RouteController {
  ////push
  static void push(BuildContext context, String route, [Object? arguments]) {
    Navigator.pushNamed(context, route, arguments: arguments);
  }

  ////push and replacement
  static void pushAndReplace(
    BuildContext context,
    String route, [
    Object? arguments,
  ]) {
    Navigator.pushReplacementNamed(context, route, arguments: arguments);
  }

  ////Push and remove untill
  static void pushAndRemoveUntil(
    BuildContext context,
    String route, [
    Object? arguments,
  ]) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      route,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  ////pop
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  ////pop and remove until
  static void popAndRemoveUntil(BuildContext context, String route) {
    Navigator.popUntil(context, ModalRoute.withName(route));
  }
}
