import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/horizontal_categories_widget.dart';

class MeditationCategorySubCategoryWidget extends StatelessWidget {
  final MeditationCategoryModel category;
  final ColorPalette theme;
  const MeditationCategorySubCategoryWidget({
    super.key,
    required this.category,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final names = ["🌙 Sleep & Deep Rest", "💓 Emotional Wellbeing"];

    return HorizontalCategoriesWidget(
      theme: theme,
      names: names,
      selectedBgColor: category.color,
      unSelectedBgColor: theme.inverseColor,
      selectedContentColor: category.contentColor,
      unSelectedContentColor: theme.textColor,
      ids: names,
      onCategoryClicked: (selectedId) {},
      enableBorder: true,
    );
  }
}
