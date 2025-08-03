// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/liked_contents_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/date_formatter.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/grid_view_builder_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/content_with_image_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class DownloadsScreen extends HookWidget {
  DownloadsScreen({super.key});

  final themeController = Get.find<ThemeController>();
  final homeController = Get.find<HomeController>();
  final likedContentsController = Get.find<LikedContentsController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;

    final isSubscribed = useState(false);

    return MainScreenLayoutWidget(
      horizontalPadding: 0,
      enableAnimation: true,
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
         homeController.changeBottomNavScreenIndex(
              context: context,
              index: 0,
              navigate: false,
            );
      },
      appBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: MainAppbarWidget(
          name: "📥 Downloads",
          onPop: () {
             homeController.changeBottomNavScreenIndex(
              context: context,
              index: 0,
              navigate: false,
            );
          },
        ),
      ),
      body:
          isSubscribed.value
              ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Access your saved meditations\nanytime, even offline.",
                      style: TypographyStyles.sniglet40016PrimaryColored(),
                    ),
                    VerticalSpace16(),
                    Obx(
                      () => GridViewBuilderWidget(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 220.r,
                          mainAxisSpacing: 10.r,
                        ),
                        itemCount:
                            homeController.madeForYouContents.value.length,
                        itemBuilder: (context, index) {
                          final content =
                              homeController.madeForYouContents.value[index];
                          return Transform.scale(
                            scale: 1,
                            child: Obx(
                              () => ContentWithImageWidget(
                                theme: theme,
                                content: content,
                                isLiked: likedContentsController
                                    .likedContents
                                    .value
                                    .contains(content),
                                onLiked: () {
                                  likedContentsController.likeContent(content);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
              : Column(
                children: [
                  // VerticalSpace8(),
                  Text(
                    "Offline listening is part of\nour Premium plan.",
                    textAlign: TextAlign.center,
                    style: TypographyStyles.snigletNormal24secondaryColored(),
                  ),
                  VerticalSpace4(),
                  Text(
                    "Subscribe to access calming voices\nanytime, anywhere.",
                    textAlign: TextAlign.center,
                    style: TypographyStyles.poppins40014(),
                  ),
                  VerticalSpace24(),
                  PrimaryButtonWidget(
                    height: 44.r,
                    width: 280.r,
                    borderOnly: true,
                    borderColor: theme.primaryColor,
                    primaryColorText: true,
                    name: "Upgrade to Premium",
                    onTap: () {
                      isSubscribed.value = !isSubscribed.value;
                    },
                    isLoading: false,
                  ),
                  VerticalSpace8(),
                  RichText(
                    text: TextSpan(
                      text: "*14-day free trial ends on ",
                      style: TypographyStyles.poppins40012PrimaryColored(),
                      children: [
                        TextSpan(
                          text: DateFormatter.formatDate(
                            "${DateTime.now().add(Duration(days: 14))}",
                          ),
                          style: TypographyStyles.poppins60010PrimaryColored(),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      ImageConstants.imgOfflineDownloadBg,
                      width: ScreenSize.width(context),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
    );
  }
}
