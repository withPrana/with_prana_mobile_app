import 'package:flutter/material.dart';

class Callbacks {
  static void postFrameCallback(void Function(Duration _) callback) {
    WidgetsBinding.instance.addPostFrameCallback(callback);
  }
}
