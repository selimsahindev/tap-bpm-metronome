import 'package:assets_audio_player/assets_audio_player.dart';

class MetronomeBrain {
  static bool _isPlaying = false;
  static int _bpm;
  static int beatsPerBar = 4;
  static int clicksPerBeat = 1;
  static int clickCount = 0;
  static Duration clickPeriod = Duration(milliseconds: 500);

  static void setBpm(int bpm) {
    _bpm = bpm;
    clickPeriod = Duration(milliseconds: (60000 / _bpm).round());
  }

  static bool isPlaying() => _isPlaying;

  static void play() {
    if (clickCount % beatsPerBar == 0) {
      AssetsAudioPlayer.playAndForget(
        Audio("assets/click_1.wav"),
      );
    } else {
      AssetsAudioPlayer.playAndForget(
        Audio("assets/click_2.wav"),
      );
    }
    clickCount++;
    print('clickCount: $clickCount');
  }

  static void togglePlaying() {
    if (_isPlaying) {
      _isPlaying = false;
    } else {
      _isPlaying = true;
      clickCount = 0;
    }
  }
}
