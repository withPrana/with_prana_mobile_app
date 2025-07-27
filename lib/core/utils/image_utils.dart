import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:with_prana_mobile_app/core/enums/toast_type_enum.dart';
import 'package:with_prana_mobile_app/core/utils/app_dialogs.dart';

class ImageUtils {
  ////
  static Future<File?> pickImage({required ImageSource source}) async {
    final picker = ImagePicker();
    try {
      final XFile? selectedImage = await picker.pickImage(source: source);

      if (selectedImage != null) {
        return File(selectedImage.path);
      } else {
        AppDialogs.showToast(
          message: "No image picked",
          toastType: ToastTypeEnum.info,
        );
        // User canceled the picker
        return null;
      }
    } on PlatformException catch (e) {
      log("Failed to pick image: $e");
      AppDialogs.showToast(
        message: "Unable to pick image",
        toastType: ToastTypeEnum.info,
      );
      return null;
    } catch (e) {
      log("Failed to pick image: $e");
      AppDialogs.showToast(
        message: "Unable to pick image",
        toastType: ToastTypeEnum.info,
      );
      return null;
    }
  }
  ////

  ////Compress image
  static Future<File> compressImage({
    required File image,
    required int compressionSizeInKb,
    required int limitedSizeInKb,
  }) async {
    final imageSize = await image.length();
    log("Image size ${imageSize / 1024} kb");
    int quality = 90;
    Uint8List? result;
    if (imageSize / 1024 > 1024) {
      while (quality > 10) {
        result = await FlutterImageCompress.compressWithFile(
          image.path,
          quality: quality,
        );

        if (result == null) return image;
        if (result.length <= compressionSizeInKb * 1024) break;

        quality -= 10;
      }
      if (result == null) return image;
      Directory tempDir;
      if (Platform.isAndroid) {
        tempDir = await getTemporaryDirectory();
      } else {
        tempDir = await getApplicationDocumentsDirectory();
      }
      final tempPath = "${tempDir.path}/cropped_image.png";
      final tempFile = await File(tempPath).writeAsBytes(result);

      log("compressed size : ${(await tempFile.length()) / 1024} kb");

      return tempFile;
    } else {
      return image;
    }
  }
}
