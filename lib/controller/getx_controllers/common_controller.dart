import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/core/constants/audio_contants.dart';
import 'package:with_prana_mobile_app/core/enums/toast_type_enum.dart';
import 'package:with_prana_mobile_app/core/utils/app_dialogs.dart';

class CommonController extends GetxController {
  final backGroundAudioPlayer = AudioPlayer();

  ////
  Future<void> setupBgAudio() async {
    try {
      await backGroundAudioPlayer.setSource(AssetSource(AudioContants.audioBg));
      await backGroundAudioPlayer.setReleaseMode(ReleaseMode.loop);
      await backGroundAudioPlayer.resume();
    } catch (e) {
      AppDialogs.showToast(
        message: e.toString(),
        toastType: ToastTypeEnum.error,
      );
    }
  }

  ////
  Future<void> pauseBgAudio() async {
    backGroundAudioPlayer.pause();
  }
}
