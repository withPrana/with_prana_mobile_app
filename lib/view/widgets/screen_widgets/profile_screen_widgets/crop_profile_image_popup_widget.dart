// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:crop_image/crop_image.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/user_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/app_dialogs.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';

class CropProfileImagePopupWidget extends HookWidget {
  final Uint8List imageBytes;
  final File image;
  final String userId;

  final userController = Get.find<UserController>();
  final themeController = Get.find<ThemeController>();
  final _cropController = CropController(
    aspectRatio: 1,
    defaultCrop: Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
  );

  CropProfileImagePopupWidget({
    super.key,
    required this.imageBytes,
    required this.image,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    final croppedImageRect = useState(Rect.fromLTRB(0.1, 0.1, 0.9, 0.9));

    return Container(
      height: ScreenSize.height(context),
      width: ScreenSize.width(context),
      color: Colors.black,
      child: Stack(
        children: [
          CropImage(
            image: Image.file(image),
            controller: _cropController,
            onCrop: (value) async {
              croppedImageRect.value = value;
            },
            loadingPlaceholder: SpinKitFadingCircle(
              color: theme.inverseColor,
              size: 24.r,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Colors.black,
              padding: EdgeInsets.all(8.r),
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TypographyStyles.poppinsNormal16Inverse(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                    child: VerticalDivider(thickness: 1.5.r),
                  ),
                  Flexible(
                    child: InkWell(
                      onTap: () async {
                        AppDialogs.showPopupLoading(
                          message: "Updating your profile picture",
                        );
                        final ui.Image croppedImage =
                            await _cropController.croppedBitmap();

                        final imageBytes = await croppedImage.toByteData(
                          format: ui.ImageByteFormat.png,
                        );
                        final pngBytes = imageBytes!.buffer.asUint8List();
                        userController.updateProfileImage(context, pngBytes);
                      },
                      child: Text(
                        "Save",
                        style: TypographyStyles.poppinsNormal16Inverse(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
