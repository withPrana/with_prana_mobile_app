import 'package:flutter/widgets.dart';

class ScreenSize {
  ////Scren width
  static width(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  ////Scren height
  static height(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }
}
