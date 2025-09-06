import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/common_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/core/constants/audio_contants.dart';
import 'package:with_prana_mobile_app/core/enums/toast_type_enum.dart';
import 'package:with_prana_mobile_app/core/shared_preferences/shared_preferences.dart';
import 'package:with_prana_mobile_app/core/utils/app_dialogs.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';

class MeditationPlayerController extends GetxController {
  CommonController commonController;

  MeditationPlayerController({required this.commonController});

  final isLoadingMeditationAudio = false.obs;

  final audioPlayer = AudioPlayer();
  final isPlaying = false.obs;
  final audioDuration = Duration.zero.obs;
  final audioPosition = Duration.zero.obs;

  final lastPlayedAudioId = ''.obs;
  final lastPlayedMeditationCategory = Rx<CategoryResponseModel?>(null);
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
      removeFloatingMediationPlayer(false);
      audioPlayer.setSource(
        lastPlayedAudioDetails.value?.audioUrl != null
            ? UrlSource(lastPlayedAudioDetails.value?.audioUrl ?? '')
            : AssetSource(AudioContants.audioSampleMeditationTwo),
      );
    });
  }

  ////
  Future<void> playMeditationAudio({
    required CategoryResponseModel meditationCategory,
    required AudioPreviewModel audioDetails,
    Duration? startingPoint,
  }) async {
    isLoadingMeditationAudio.value = true;
    try {
      await audioPlayer.setSource(
        audioDetails.audioUrl != null
            ? UrlSource(audioDetails.audioUrl ?? '')
            : AssetSource(AudioContants.audioSampleMeditationTwo),
      );
      await audioPlayer.seek(startingPoint ?? Duration.zero);
      await SharedPrefs.setLastPlayedMeditationId("1");
      lastPlayedMeditationCategory.value = meditationCategory;
      lastPlayedAudioDetails.value = audioDetails;
      lastPlayedAudioId.value = "1";
      showFloatingMeditationPlayer.value =
          lastPlayedAudioDetails.value != null ||
          lastPlayedAudioId.value.isNotEmpty ||
          lastPlayedMeditationCategory.value != null;

      await commonController.backGroundAudioPlayer.pause();

      await audioPlayer.resume();
      isPlaying.value = true;
    } catch (e) {
      AppDialogs.showToast(
        message: "unable to play audio $e",
        toastType: ToastTypeEnum.error,
      );
    } finally {
      isLoadingMeditationAudio.value = false;
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

  Future<void> playAndPauseMeditationAudio({
    CategoryResponseModel? meditationCategory,
    AudioPreviewModel? audioDetails,
    required bool playBgAudio,
  }) async {
    if (isPlaying.value) {
      await audioPlayer.pause();
      isPlaying.value = false;
      if (playBgAudio) {
        commonController.backGroundAudioPlayer.resume();
      }
    } else {
      await audioPlayer.resume();
      lastPlayedMeditationCategory.value = meditationCategory;
      lastPlayedAudioDetails.value = audioDetails;
      lastPlayedAudioId.value = "1";
      showFloatingMeditationPlayer.value =
          lastPlayedAudioDetails.value != null ||
          lastPlayedAudioId.value.isNotEmpty ||
          lastPlayedMeditationCategory.value != null;
      isPlaying.value = true;
    }
  }

  Future<void> seekAudio(int value) async {
    final position = Duration(seconds: value);
    audioPlayer.seek(position);
  }

  Future<void> restartAudio() async {
    await audioPlayer.seek(Duration.zero);
  }

  void removeFloatingMediationPlayer(bool removeAudioDetails) {
    SharedPrefs.setLastPlayedMeditationId("");
    audioPosition.value = Duration.zero;
    audioPlayer.stop();
    if(removeAudioDetails){
      lastPlayedMeditationCategory.value = null;
    lastPlayedAudioDetails.value = null;
    lastPlayedAudioId.value = "";
    }
    showFloatingMeditationPlayer.value = false;
  }
}
