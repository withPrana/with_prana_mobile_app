import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/common_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/core/constants/audio_contants.dart';
import 'package:with_prana_mobile_app/core/enums/toast_type_enum.dart';
import 'package:with_prana_mobile_app/core/shared_preferences/shared_preferences.dart';
import 'package:with_prana_mobile_app/core/utils/app_dialogs.dart';

class MeditationPlayerController extends GetxController {
  CommonController commonController;

  MeditationPlayerController({required this.commonController});

  final audioPlayer = AudioPlayer();
  final isPlaying = false.obs;
  final audioDuration = Duration.zero.obs;
  final audioPosition = Duration.zero.obs;

  final lastPlayedAudioId = ''.obs;
  final lastPlayedMeditationCategory = Rx<MeditationCategoryModel?>(null);
  final lastPlayedAudioDetails = Rx<AudioPreviewModel?>(null);

  final showFloatingMeditationPlayer = false.obs;

  @override
  void onClose() {
    super.onClose();
    audioPlayer.pause();
  }

  Future<void> setupAndListenForAudioState() async {
    ////listen for duration change
    audioPlayer.onDurationChanged.listen((duration) {
      audioDuration.value = duration;
    });
    ////listen for position change
    audioPlayer.onPositionChanged.listen((duration) {
      audioPosition.value = duration;
    });
    ////handle when audio completes
    audioPlayer.onPlayerComplete.listen((_) {
      audioPosition.value = Duration.zero;
      isPlaying.value = false;
    });
  }

  ////
  Future<void> playMeditationAudio({
    required MeditationCategoryModel meditationCategory,
    required AudioPreviewModel audioDetails,
    Duration? startingPoint,
  }) async {
    try {
      if (audioPosition.value != Duration.zero) {
        await audioPlayer.seek(startingPoint ?? Duration.zero);
        await SharedPrefs.setLastPlayedMeditationId("1");
        lastPlayedMeditationCategory.value = meditationCategory;
        lastPlayedAudioDetails.value = audioDetails;
        lastPlayedAudioId.value = "1";
        showFloatingMeditationPlayer.value =
            lastPlayedAudioDetails.value != null ||
            lastPlayedAudioId.value.isNotEmpty ||
            lastPlayedMeditationCategory.value != null;
      }
      await commonController.backGroundAudioPlayer.pause();
      await audioPlayer.setSource(
        AssetSource(AudioContants.audioSampleMeditationTwo),
      );
      await audioPlayer.resume();
      isPlaying.value = true;
    } catch (e) {
      AppDialogs.showToast(
        message: "unable to play audio $e",
        toastType: ToastTypeEnum.error,
      );
    }
  }

  ////format audio position timing to minutes:seconds format
  String formattedAudioPosition() {
    final minutes = audioPosition.value.inMinutes;
    final seconds = audioPosition.value.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    final formattedDuartion = "$minutes:$seconds";
    return formattedDuartion;
  }

  ////format audio position timing to minutes:seconds format
  String formattedAudioDuration() {
    final minutes = audioDuration.value.inMinutes;
    final seconds = audioDuration.value.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    final formattedDuartion = "$minutes:$seconds";
    return formattedDuartion;
  }

  Future<void> playAndPauseMeditationAudio() async {
    if (isPlaying.value) {
      await audioPlayer.pause();
      isPlaying.value = false;
    } else {
      await audioPlayer.resume();
      isPlaying.value = true;
    }
  }

  Future<void> restartAudio() async {
    await audioPlayer.seek(Duration.zero);
  }

  void removeFloatingMediationPlayer() {
    SharedPrefs.setLastPlayedMeditationId("");
    lastPlayedMeditationCategory.value = null;
    lastPlayedAudioDetails.value = null;
    lastPlayedAudioId.value = "";
    showFloatingMeditationPlayer.value =
        lastPlayedAudioDetails.value != null ||
        lastPlayedAudioId.value.isNotEmpty ||
        lastPlayedMeditationCategory.value != null;
  }
}
