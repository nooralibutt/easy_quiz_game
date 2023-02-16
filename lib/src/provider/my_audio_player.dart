import 'package:audioplayers/audioplayers.dart';

class MyAudioPlayer {
  // Singleton instance code
  static final MyAudioPlayer _instance = MyAudioPlayer._();
  static MyAudioPlayer get instance => _instance;
  MyAudioPlayer._() {
    AudioPlayer.global.setGlobalAudioContext(
      const AudioContext(
        iOS: AudioContextIOS(
          category: AVAudioSessionCategory.playback,
          options: [
            AVAudioSessionOptions.mixWithOthers,
            AVAudioSessionOptions.defaultToSpeaker,
          ],
        ),
      ),
    );
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  final _alertSource = AssetSource('sounds/alert.mp3');
  void playAlert() => _audioPlayer.play(_alertSource);

  final _levelCompleteSource = AssetSource('sounds/level_completed.mp3');
  void playLevelComplete() => _audioPlayer.play(_levelCompleteSource);

  final _correctAnswerSource = AssetSource('sounds/correct.mp3');
  void playCorrectAnswer() => _audioPlayer.play(_correctAnswerSource);

  final _wrongAnswerSource = AssetSource('sounds/wrong_answer.mp3');
  void playWrongAnswer() => _audioPlayer.play(_wrongAnswerSource);

  final _levelFailedSource = AssetSource('sounds/level_failed.mp3');
  void playLevelFailed() => _audioPlayer.play(_levelFailedSource);

  final _bubblePopSource = AssetSource('sounds/bubble_pop.mp3');
  void playBubblePop() => _audioPlayer.play(_bubblePopSource);

  final _buttonTapSource = AssetSource('sounds/click_button.mp3');
  void playButtonTap() => _audioPlayer.play(_buttonTapSource);

  final _selectorSource = AssetSource('sounds/selector.mp3');
  void playLevelSelect() => _audioPlayer.play(_selectorSource);
}
