import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/category_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/meditation_player_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/callbacks.dart';
import 'package:with_prana_mobile_app/core/utils/hex_to_color.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/bottom_navigation_bar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/meditation_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/loader_widgets/data_loader_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/meditation_category_screen_widgets/meditation_category_audios_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/meditation_category_screen_widgets/meditation_category_sub_category_widget.dart';

class MeditationCategoryScreen extends HookWidget {
  static const routePath = "/meditation-category";

  final CategoryResponseModel meditationCategory;
  MeditationCategoryScreen({super.key, required this.meditationCategory});

  final themeController = Get.find<ThemeController>();
  final meditationPlayerController = Get.find<MeditationPlayerController>();
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Callbacks.postFrameCallback((_) {
        categoryController.getCategoryById(meditationCategory.id.toString());
      });
      return null;
    }, []);

    final theme = themeController.appTheme.value!;
    final contentColor = hexToColor(
      hex: meditationCategory.color ?? '',
      theme: theme,
    );
    return MeditationScreenLayoutWidget(
      theme: theme,
      body: Obx(
        () => DataLoaderWidget(
          data: categoryController.categoryById.value,
          noDataMessage: "No meditations found",
          isLoading: categoryController.isLoadingCategoryById.value,
          loadingPositionTop: 0,
          noDataMessagePositionTop: 200,
          dataWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120.h),
              Text(
                "Drift into rest with gentle sounds and soothing breath.",
                style: TypographyStyles.sniglet40020Colored(contentColor),
              ),
              VerticalSpace8(),
              MeditationCategorySubCategoryWidget(
                category: meditationCategory,
                theme: theme,
              ),
              Expanded(
                child: MeditationCategoryAudiosWidget(
                  meditationCategory: meditationCategory,
                  meditationCategoryById: categoryController.categoryById.value,
                  meditationPlayerController: meditationPlayerController,
                  theme: theme,
                ),
              ),
            ],
          ),
          theme: theme,
        ),
      ),
      meditationCategory: meditationCategory,
      bottomNavigationBar: BottomNavigationBarWidget(navigate: true),
    );
  }
}
