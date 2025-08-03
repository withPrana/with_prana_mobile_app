// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/liked_contents_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/horizontal_categories_widget.dart';

class LikedContentCategoriesWidget extends StatelessWidget {
  final LikedContentsController likedContentsController;
  final ThemeController themeController;
  const LikedContentCategoriesWidget({
    super.key,
    required this.likedContentsController,
    required this.themeController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return HorizontalCategoriesWidget(
      names: likedContentsController.categories.value,
      selectedBgColor: theme.primaryLightColor,
      unSelectedBgColor: theme.inverseColor,
      selectedContentColor: theme.textColor,
      unSelectedContentColor: theme.textColor,
      ids: likedContentsController.categories.value,
      onCategoryClicked: (selectedId) {
        likedContentsController.selectCategory(selectedId);
      },
      enableBorder: true,
    );
  }
}
