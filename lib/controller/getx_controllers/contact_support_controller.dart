import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/core/enums/toast_type_enum.dart';
import 'package:with_prana_mobile_app/core/utils/app_dialogs.dart';

class ContactSupportController extends GetxController {
  final subjectController = TextEditingController();
  final messageController = TextEditingController();
  final attachmentFileNameController = TextEditingController();

  final attachmentFile = Rx<FilePickerResult?>(null);

  final isLoadingSendMessage = false.obs;

  ////
  Future<void> attachFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      compressionQuality: 70,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );
    if (pickedFile != null) {
      final filePath = pickedFile.files.single.path!;
      final file = File(filePath);

      final fileSizeInBytes = await file.length();
      final fileSizeInMb = fileSizeInBytes / (1024 * 1024);
      if (fileSizeInMb > 5) {
        AppDialogs.showToast(
          message: "File size exceeds 5MB. Please select a smaller file.",
          toastType: ToastTypeEnum.warning,
        );
      } else {
        attachmentFile.value = pickedFile;
        attachmentFileNameController.text =
            attachmentFile.value!.files.single.name;
      }
    }
  }

  /////////
  void removeAttchedFile() {
    attachmentFile.value = null;
    attachmentFileNameController.clear();
  }

  void initReset() {
    subjectController.clear();
    messageController.clear();
    removeAttchedFile();
    isLoadingSendMessage(false);
  }
}
