import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/common_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/liked_contents_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/meditation_player_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/hex_to_color.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/meditation_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/loader_widgets/data_loader_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/play_meditation_screen_widgets/audio_player_controller_widget.dart';

class PlayMeditationScreen extends StatefulHookWidget {
  static const routePath = "/play-meditation";

  final CategoryResponseModel meditationCategory;
  final AudioPreviewModel audioDetails;
  final Duration? startingPoint;

  const PlayMeditationScreen({
    super.key,
    this.startingPoint,
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
  final likedContentsController = Get.find<LikedContentsController>();

  @override
  Widget build(BuildContext context) {
    final isLiked = useState(false);
    final theme = themeController.appTheme.value!;

    final contentColor = hexToColor(
      hex: widget.meditationCategory.color ?? '',
      theme: theme,
    );

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        meditationPlayerController.playMeditationAudio(
          audioDetails: widget.audioDetails,
          meditationCategory: widget.meditationCategory,
          startingPoint: widget.startingPoint,
        );
        meditationPlayerController.setupAndListenForAudioState();
      });
      return null;
    }, []);

    return MeditationScreenLayoutWidget(
      theme: theme,
      body: SingleChildScrollView(
        child: Obx(
          () => DataLoaderWidget(
            loadingPositionTop: ScreenSize.width(context) / 1.5,
            noDataMessagePositionTop: ScreenSize.width(context) / 1.5,
            data: "",
            noDataMessage: "No meditation found",
            isLoading:
                meditationPlayerController.isLoadingMeditationAudio.value,
            dataWidget: Column(
              children: [
                VerticalSpace16(),
                Stack(
                  children: [
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
                          image:
                              widget.audioDetails.thumbnail.isEmpty
                                  ? AssetImage(
                                    ImageConstants.imgMeditationCategory,
                                  )
                                  : NetworkImage(widget.audioDetails.thumbnail),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 24.r,
                      right: 24.r,
                      child: InkWell(
                        onTap: () {
                          if (isLiked.value) {
                            likedContentsController.dislikeMeditation(
                              widget.audioDetails.id,
                            );
                            isLiked.value = false;
                          } else {
                            likedContentsController.likeMeditation(
                              widget.audioDetails.id,
                            );
                            isLiked.value = true;
                          }
                        },
                        child: CircleAvatar(
                          radius: 14.r,
                          backgroundColor:
                              isLiked.value
                                  ? Colors.red
                                  : theme.inverseColor.withValues(alpha: 0.6),
                          child: Center(
                            child: ImageIcon(
                              AssetImage(IconConstants.icFavourite),
                              size: 16.r,
                              color:
                                  isLiked.value
                                      ? theme.inverseColor
                                      : theme.disabledColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                VerticalSpace16(),
                Text(
                  widget.audioDetails.title,
                  textAlign: TextAlign.center,
                  style: TypographyStyles.sniglet40024Colored(contentColor),
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
            theme: theme,
          ),
        ),
      ),
      meditationCategory: widget.meditationCategory,
      bottomNavigationBar: Obx(() {
        if (meditationPlayerController.isLoadingMeditationAudio.value) {
          return SizedBox();
        }
        return AudioPlayerControllerWidget(
          theme: theme,
          meditationCategory: widget.meditationCategory,
          audioDetails: widget.audioDetails,
          meditationPlayerController: meditationPlayerController,
        );
      }),
    );
  }
}
