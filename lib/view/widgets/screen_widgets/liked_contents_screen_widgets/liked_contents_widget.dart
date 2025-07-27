// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
import 'package:with_prana_mobile_app/controller/liked_contents_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/list_view_builder_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/audio_palyer_preview_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class LikedContentsWidget extends StatelessWidget {
  const LikedContentsWidget({super.key, required this.likedContentsController});

  final LikedContentsController likedContentsController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListViewBuilderWidget(
        itemCount: likedContentsController.likedContents.value.length,
        itemBuilder: (context, index) {
          final content = likedContentsController.likedContents.value[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(28.r),
            child: SwipeActionCell(
              backgroundColor: Colors.red,
              key: ObjectKey(content.index),
              trailingActions: [
                SwipeAction(
                  widthSpace: 80.w,
                  title: "Remove",
                  style: TypographyStyles.poppinsBold10Inverse(),
                  content: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(28.r),
                      ),
                    ),
                  ),
                  performsFirstActionWithFullSwipe: true,
                  onTap: (handler) {
                    likedContentsController.removeLikedContent(content);
                  },
                ),
              ],
              child: AudioPalyerPreviewWidget(
                audioDetails: AudioPreviewModel(
                  iconPath: content.iconPath,
                  title: content.title,
                  category: content.category,
                  iconColor: content.iconColor,
                  minutes: content.minutes,
                ),
              ),
            ),
          );
        },
        seperatorWidget: VerticalSpace8(),
      ),
    );
  }
}
