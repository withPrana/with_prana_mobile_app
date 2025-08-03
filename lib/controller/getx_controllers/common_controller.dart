import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:with_prana_mobile_app/core/constants/audio_contants.dart';

class CommonController extends GetxController {
  final backGroundAudioPlayer = AudioPlayer();
  final sampleAudioPlayer = AudioPlayer();

  ////
  Future<void> setupBgAudio() async {
    await backGroundAudioPlayer.setAsset(AudioContants.audioBg);
    await backGroundAudioPlayer.setLoopMode(LoopMode.all);
    await backGroundAudioPlayer.play();
  }

  ////
  Future<void> playSampleMeditationAudio() async {
    await backGroundAudioPlayer.pause();
    await sampleAudioPlayer.setAsset(AudioContants.audioSampleMeditation);
    await sampleAudioPlayer.play();
  }

  Future<void> pauseSampleMeditationAudio() async {
    await sampleAudioPlayer.pause();
    await backGroundAudioPlayer.play();
  }

  ////
  Future<void> pauseBgAudio() async {
    backGroundAudioPlayer.pause();
  }
}
