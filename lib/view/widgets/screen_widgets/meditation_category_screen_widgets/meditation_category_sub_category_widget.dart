import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/utils/hex_to_color.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/horizontal_categories_widget.dart';

class MeditationCategorySubCategoryWidget extends StatelessWidget {
  final CategoryResponseModel category;
  final ColorPalette theme;
  const MeditationCategorySubCategoryWidget({
    super.key,
    required this.category,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final contentColor = hexToColor(category.color ?? '');
    final bgColor = contentColor.withValues(alpha: 0.1);
    final names = ["🌙 Sleep & Deep Rest", "💓 Emotional Wellbeing"];

    return HorizontalCategoriesWidget(
      theme: theme,
      names: names,
      selectedBgColor: bgColor,
      unSelectedBgColor: theme.inverseColor,
      selectedContentColor: contentColor,
      unSelectedContentColor: theme.textColor,
      ids: names,
      onCategoryClicked: (selectedId) {},
      enableBorder: true,
    );
  }
}
