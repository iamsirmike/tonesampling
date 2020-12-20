import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

class ControlTones extends ChangeNotifier {
  AudioPlayer result;
  void playTone(String path) async {
    final player = AudioCache();
    result = await player.play(path);
    notifyListeners();
  }

  void pauseTone() {
    result.pause();
  }

  void stopTone() {
    result.stop();
  }
}
