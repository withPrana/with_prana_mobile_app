import 'package:flutter/material.dart';

double safeAreaBottomHeight(BuildContext context) {
  return MediaQuery.of(context).padding.bottom;
}
