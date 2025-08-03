import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:with_prana_mobile_app/core/constants/audio_contants.dart';

class CommonController extends GetxController {
  final audioPlayer = AudioPlayer();

  ////
  Future<void> setupBgAudio() async {
    await audioPlayer.setAsset(AudioContants.audioBg);
    audioPlayer.setLoopMode(LoopMode.one);
    audioPlayer.play();
  }

  ////
  Future<void> pauseBgAudio() async {
    audioPlayer.pause();
    // audioPlayer.pause();
  }
}
