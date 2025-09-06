import 'package:flutter/material.dart';

double safeAreaBottomHeight(BuildContext context) {
  final bottomSafeArea = MediaQuery.of(context).padding.bottom;
  return bottomSafeArea;
}
