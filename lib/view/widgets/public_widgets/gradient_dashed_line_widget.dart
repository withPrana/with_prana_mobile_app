import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class GradientDashedLineWidget extends StatelessWidget {
  GradientDashedLineWidget({super.key});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace32(),
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              stops: [0.05, 0.5, 0.95],
              colors: [Colors.transparent, Color(0xff63AF95), Colors.transparent],
            ).createShader(bounds);
          },
          child: DottedLine(lineThickness: 1.2.r, dashColor: Colors.white),
        ),
        VerticalSpace32(),
      ],
    );
  }
}
