import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';

class MeditationCategoryBgWidget extends StatelessWidget {
  final MeditationCategoryModel meditationCategory;
  const MeditationCategoryBgWidget({super.key, required this.meditationCategory});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: SizedBox(
        width: ScreenSize.width(context),
        height: ScreenSize.height(context),

        child: Stack(
          children: [
            Image.asset(
              ImageConstants.imgMeditationCategoryBg,
              width: ScreenSize.width(context),
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: ScreenSize.width(context),
                height: ScreenSize.height(context),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2, 0.34],
                    colors: [
                      meditationCategory.contentColor.withValues(alpha: 0),
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
