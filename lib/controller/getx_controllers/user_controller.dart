// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:with_prana_mobile_app/core/utils/app_dialogs.dart';
import 'package:with_prana_mobile_app/core/utils/image_utils.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/profile_screen_widgets/crop_profile_image_popup_widget.dart';

class UserController extends GetxController {
  final userProfilePicture = Rx<File?>(null);

  ////Select and crop image
  Future<void> selectProfileImage(
    BuildContext context,
    ImageSource source,
  ) async {
    final pickedImage = await ImageUtils.pickImage(source: source);
    if (pickedImage != null) {
      final imageBytes = await pickedImage.readAsBytes();
      await showDialog(
        context: context,
        builder:
            (_) => CropProfileImagePopupWidget(
              imageBytes: imageBytes,
              image: pickedImage,
              userId: "",
            ),
      );
    }
  }

  ////Compress and update image
  Future<void> updateProfileImage(
    BuildContext context,
    Uint8List imageBytes,
  ) async {
    Directory? dir;
    if (Platform.isAndroid) {
      dir = await getDownloadsDirectory();
    } else {
      dir = await getApplicationDocumentsDirectory();
    }
    if (!await dir!.exists()) {
      await dir.create(
        recursive: true,
      ); //// Create the directory if it doesn't exist
    }
    final path =
        "${dir.path}/cropped_image.png${DateTime.now().millisecondsSinceEpoch.toString()}";
    final croppedImageFile = File(path);
    final tempSavedCroppedImage = await croppedImageFile.writeAsBytes(
      imageBytes,
    );
    File fileToUpload;
    ////Image compression
    if (await tempSavedCroppedImage.length() > (1024 * 1024)) {
      fileToUpload = await ImageUtils.compressImage(
        image: tempSavedCroppedImage,
        compressionSizeInKb: 500,
        limitedSizeInKb: 1024,
      );
    } else {
      fileToUpload = tempSavedCroppedImage;
    }
    userProfilePicture(fileToUpload);
    try {
      // croppedImageFile.delete();
    } catch (e) {
      log(e.toString());
    }
    AppDialogs.stopPopupLoading();
    Navigator.pop(context);
  }
}
