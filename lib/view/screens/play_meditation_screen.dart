import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/common_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/meditation_player_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/meditation_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/play_meditation_screen_widgets/audio_player_controller_widget.dart';

class PlayMeditationScreen extends StatefulHookWidget {
  static const routePath = "/play-meditation";

  final MeditationCategoryModel meditationCategory;
  final AudioPreviewModel audioDetails;

  const PlayMeditationScreen({
    super.key,
    required this.meditationCategory,
    required this.audioDetails,
  });

  @override
  State<PlayMeditationScreen> createState() => _PlayMeditationScreenState();
}

class _PlayMeditationScreenState extends State<PlayMeditationScreen> {
  final themeController = Get.find<ThemeController>();
  final meditationPlayerController = Get.find<MeditationPlayerController>();
  final commonController = Get.find<CommonController>();

  @override
  void dispose() {
    Future.delayed(Duration.zero, () async {
      await meditationPlayerController.audioPlayer.pause();
      commonController.resumeBgAudio();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        meditationPlayerController.playMeditationAudio();
        meditationPlayerController.setupAndListenForAudioState();
      });
      return null;
    }, []);

    return MeditationScreenLayoutWidget(
      body: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpace16(),
            Container(
              width: ScreenSize.width(context),
              height: ScreenSize.width(context) + 20.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(
                  color: theme.disabledLightestColor,
                  width: 10.r,
                ),
                image: DecorationImage(
                  image: AssetImage(ImageConstants.imgMeditationCategory),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            VerticalSpace16(),
            Text(
              widget.audioDetails.title,
              textAlign: TextAlign.center,
              style: TypographyStyles.sniglet40024Colored(
                widget.meditationCategory.contentColor,
              ),
            ),
            VerticalSpace8(),
            Text(
              widget.audioDetails.category.isNotEmpty
                  ? "${widget.audioDetails.minutes} min • ${widget.audioDetails.category}"
                  : "${widget.audioDetails.minutes} min",
              style: TypographyStyles.poppins40012(),
            ),
            VerticalSpace24(),
            if ((widget.audioDetails.description ?? '').isNotEmpty)
              Text(
                widget.audioDetails.description ?? '',
                textAlign: TextAlign.center,
                style: TypographyStyles.poppins40014(),
              ),
            VerticalSpace224(),
          ],
        ),
      ),
      meditationCategory: widget.meditationCategory,
      bottomNavigationBar: AudioPlayerControllerWidget(
        theme: theme,
        meditationCategory: widget.meditationCategory,
        meditationPlayerController: meditationPlayerController,
      ),
    );
  }
}
