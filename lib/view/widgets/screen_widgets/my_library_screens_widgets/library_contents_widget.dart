// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/my_library_controller.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/list_view_builder_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/audio_palyer_preview_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class LibraryContentsWidget extends StatelessWidget {
  final MyLibraryController myLibraryController;
  const LibraryContentsWidget({super.key, required this.myLibraryController});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListViewBuilderWidget(
        itemCount: myLibraryController.libraryContents.value.length,
        itemBuilder: (context, index) {
          final content = myLibraryController.libraryContents.value[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(28.r),
            child: AudioPalyerPreviewWidget(
              meditationCategory: CategoryResponseModel(),
              audioDetails: AudioPreviewModel(
                iconPath: content.iconPath,
                title: content.title,
                category: content.category,
                iconColor: content.iconColor,
                minutes: content.minutes,
              ),
            ),
          );
        },
        seperatorWidget: VerticalSpace8(),
      ),
    );
  }
}
