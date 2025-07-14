import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/constants/logo_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';

class SplashScreen extends HookWidget {
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
      duration: const Duration(milliseconds: 300),
    );

    final iconOffset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -1.8),
    ).animate(
      CurvedAnimation(parent: iconMoveController, curve: Curves.easeOut),
    );

    final iconScale = Tween<double>(begin: 1.0, end: 0.4).animate(
      CurvedAnimation(parent: iconMoveController, curve: Curves.easeInOut),
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
            });
          });
        });
      });

      return null;
    }, []);

    return Scaffold(
      body: Stack(
        children: [
          // Background
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
              image:
                  showBackground.value
                      ? DecorationImage(
                        image: AssetImage(
                          ImageConstants.imgSplashScreenCenterBg,
                        ),
                        opacity: 0.5,
                        // fit: BoxFit.cover,
                      )
                      : null,
            ),
          ),

          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: showInitial.value ? 1.0 : 0.0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                ImageConstants.imgSplashScreenTopBg,
                width: ScreenSize.width(context) / 1.2,
              ),
            ),
          ),

          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: showLogo.value ? 1 : 0,
              child: SlideTransition(
                position: iconOffset,
                child: ScaleTransition(
                  scale: iconScale,
                  child: Image.asset(width: 158, LogoConstants.logoMain),
                ),
              ),
            ),
          ),

          // Bottom text
          Positioned(
            bottom: 150,
            right: 10,
            left: 10,
            child: AnimatedOpacity(
              opacity: showInitial.value ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Reconnect. Heal. Awaken.',
                  style: TypographyStyles.poppinsNormal12ColoredItalic(),
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
                  AnimatedTextKit(
                    totalRepeatCount: 1,
                    isRepeatingAnimation: false,
                    onFinished: () => showButton.value = true,
                    animatedTexts: [
                      TyperAnimatedText(
                        'Silence is not empty\nIt’s full of answers',
                        textStyle: TypographyStyles.snigletNormal24Colored(),
                        textAlign: TextAlign.center,
                        speed: const Duration(milliseconds: 75),
                      ),
                    ],
                  ),
                  AnimatedOpacity(
                    opacity: showAuthor.value ? 1 : 0,
                    duration: Duration(milliseconds: 500),
                    child: Text(
                      "— Rumi",
                      style: TypographyStyles.poppinsNorma16IBrown(),
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
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Color(0xffF5F5F5), width: 2),
                ),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Color(0xffF5F5F5), width: 2),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xffF5F5F5), width: 2),
                    ),
                    child: PrimaryButtonWidget(
                      width: 128,
                      height: 40,
                      onTap: () {},
                      isLoading: false,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        children: [
                          Text(
                            "Begin",
                            style: TypographyStyles.poppinsNormal6Inverse(),
                          ),
                          ImageIcon(
                            AssetImage(IconConstants.icArrowRight),
                            color: theme.inverseColor,
                            size: 18,
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
