// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/my_library_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/horizontal_categories_widget.dart';

class LibraryCategoriesWidget extends StatelessWidget {
  final MyLibraryController myLibraryController;
  final ThemeController themeController;
  const LibraryCategoriesWidget({
    super.key,
    required this.myLibraryController,
    required this.themeController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return HorizontalCategoriesWidget(
      names: myLibraryController.categories.value,
      selectedBgColor: theme.primaryColor,
      unSelectedBgColor: theme.inverseColor,
      selectedContentColor: theme.inverseColor,
      unSelectedContentColor: theme.textColor,
      ids: myLibraryController.categories.value,
      onCategoryClicked: (selectedId) {
        myLibraryController.selectCategory(selectedId);
      },
    );
  }
}
