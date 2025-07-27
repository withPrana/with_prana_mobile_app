// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
import 'package:with_prana_mobile_app/controller/liked_contents_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
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
      appBar: MainAppbarWidget(name: "📥 Downloads"),
      body: SingleChildScrollView(
        child:
            isSubscribed.value
                ? Column(
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
                          mainAxisExtent: 240.r,
                          mainAxisSpacing: 10.r,
                        ),
                        itemCount:
                            homeController.madeForYouContents.value.length,
                        itemBuilder: (context, index) {
                          final content =
                              homeController.madeForYouContents.value[index];
                          return Obx(
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
                          );
                        },
                      ),
                    ),
                  ],
                )
                : Column(
                  children: [
                    VerticalSpace8(),
                    Text(
                      "Offline listening is part of\nour Premium plan.",
                      textAlign: TextAlign.center,
                      style: TypographyStyles.snigletNormal22secondaryColored(),
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
                        style: TypographyStyles.poppins4008PrimaryColored(),
                        children: [
                          TextSpan(
                            text: DateFormatter.formatDate(
                              "${DateTime.now().add(Duration(days: 14))}",
                            ),
                            style: TypographyStyles.poppins6008PrimaryColored(),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 440.w,
                        child: OverflowBox(
                          maxWidth: ScreenSize.width(context),
                          maxHeight: 440.w,
                          child: Image.asset(
                            ImageConstants.imgOfflineDownloadBg,
                            width: ScreenSize.width(context),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
