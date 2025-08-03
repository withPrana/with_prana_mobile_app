// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/grid_view_builder_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/each_meditation_category_widget.dart';

class MeditationCategoriesWidget extends StatelessWidget {
  MeditationCategoriesWidget({super.key});

  final themeController = Get.find<ThemeController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return Column(
      children: [
        Container(
          width: ScreenSize.width(context),
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: theme.inverseColor,
            border: Border.all(
              color: theme.primaryScreenGradient[0],
              width: 1.r,
            ),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Let’s Begin With", style: TypographyStyles.sniglet40016()),
              VerticalSpace8(),
              LayoutBuilder(
                builder: (context, contraints) {
                  final maxWidth = contraints.maxWidth;
                  final mainAxisExtend = (maxWidth / 2) - 20.r;
                  return Stack(
                    children: [
                      GridViewBuilderWidget(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: mainAxisExtend,
                          crossAxisSpacing: 20.r,
                          mainAxisSpacing: 20.r,
                        ),
                        itemCount: 4,
                        itemBuilder:
                            (context, index) => Obx(
                              () => EachMeditationCategoryWidget(
                                meditationCategory:
                                    homeController
                                        .meditationCategories
                                        .value[index],
                              ),
                            ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Image.asset(
                            ImageConstants.imgCategoriesCenterFlower,
                            width: 24.r,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        VerticalSpace32(),
      ],
    );
  }
}
