import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/constants/logo_constants.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/screens/name_entry_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/secondary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/splash_screen_widgets/animated_text_widget.dart';

class SplashScreen extends HookWidget {
  static const routePath = "/splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final theme = themeController.appTheme.value!;

    final showInitial = useState(false);
    final showBackground = useState(false);
    final showFinalText = useState(false);
    final showButton = useState(false);
    final showLogo = useState(false);
    final showAuthor = useState(false);

    final iconMoveController = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );

    final iconOffset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -1.4),
    ).animate(
      CurvedAnimation(parent: iconMoveController, curve: Curves.easeOutBack),
    );

    final iconScale = Tween<double>(begin: 1.0, end: 0.35).animate(
      CurvedAnimation(parent: iconMoveController, curve: Curves.easeOutBack),
    );

    useEffect(() {
      Future.delayed(const Duration(seconds: 1), () async {
        showLogo.value = true;
        showInitial.value = true;
        Future.delayed(const Duration(milliseconds: 1800), () {
          showInitial.value = false;
          iconMoveController.forward();
          Future.delayed(const Duration(milliseconds: 1000), () {
            showBackground.value = true;
            showFinalText.value = true;
            Future.delayed(const Duration(seconds: 4), () {
              showAuthor.value = true;
              showButton.value = true;
            });
          });
        });
      });

      return null;
    }, []);

    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: ScreenSize.width(context),
            height: ScreenSize.height(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: theme.splashGradient,
              ),
            ),
          ),

          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: showBackground.value ? 1.0 : 0.0,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                ImageConstants.imgSplashScreenCenterBg,
                width: ScreenSize.width(context) / 1.1,
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: showInitial.value ? 1.0 : 0.0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                ImageConstants.imgCareHand,
                width: ScreenSize.width(context) / 1.2,
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: showLogo.value ? 1 : 0,
                child: SlideTransition(
                  position: iconOffset,
                  child: ScaleTransition(
                    scale: iconScale,
                    child: Image.asset(width: 158.r, LogoConstants.logoMain),
                  ),
                ),
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 190),
              child: AnimatedOpacity(
                opacity: showInitial.value ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    ImageConstants.imgWithPranaLabel,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          //// Bottom text
          Positioned(
            bottom: 150,
            right: 10.r,
            left: 10.r,
            child: AnimatedOpacity(
              opacity: showInitial.value ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Reconnect. Heal. Awaken.',
                  style:
                      TypographyStyles.poppinsNormal10secondaryColoredItalic(),
                ),
              ),
            ),
          ),

          // Final animated text
          if (showFinalText.value)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 24,
                children: [
                  TypewriterText(),

                  AnimatedOpacity(
                    opacity: showAuthor.value ? 1 : 0,
                    duration: Duration(milliseconds: 500),
                    child: Text(
                      "— Rumi",
                      style: TypographyStyles.poppins50014Brown(),
                    ),
                  ),
                ],
              ),
            ),

          ////begin button
          AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            opacity: showButton.value ? 1.0 : 0.0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(12.r),
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  border: Border.all(
                    color: Color(0xffF5F5F5).withValues(alpha: 0.4),
                    width: 2.r,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(
                      color: Color(0xffF5F5F5).withValues(alpha: 0.6),
                      width: 2,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: Color(0xffF5F5F5).withValues(alpha: 0.8),
                        width: 2.r,
                      ),
                    ),
                    child: SecondaryButtonWidget(
                      width: 128.r,
                      onTap: () {
                        RouteController.pushAndRemoveUntil(
                          context,
                          NameEntryScreen.routePath,
                        );
                      },
                      isLoading: false,
                      borderColor: Color(0xffF5F5F5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        children: [
                          Text(
                            "Begin",
                            style: TypographyStyles.poppinsBold14Inverse(),
                          ),
                          ImageIcon(
                            AssetImage(IconConstants.icArrowRight),
                            color: theme.inverseColor,
                            size: 18.r,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
