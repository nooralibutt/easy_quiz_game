import 'package:just_audio/just_audio.dart';

class AudioManager {
  // Singleton instance code
  static final AudioManager _instance = AudioManager._();
  static AudioManager get instance => _instance;
  AudioManager._();

  final _alertPlayer = AudioPlayer();
  final _levelCompletePlayer = AudioPlayer();
  final _correctAnswerPlayer = AudioPlayer();
  final _wrongAnswerPlayer = AudioPlayer();
  final _levelFailedPlayer = AudioPlayer();
  final _bubblePopPlayer = AudioPlayer();
  final _buttonTapPlayer = AudioPlayer();
  final _selectorPlayer = AudioPlayer();

  Future<void> init() async {
    await _alertPlayer
        .setAudioSource(AudioSource.asset("assets/sounds/alert.mp3"));
    await _levelCompletePlayer
        .setAudioSource(AudioSource.asset("assets/sounds/level_completed.mp3"));
    await _correctAnswerPlayer
        .setAudioSource(AudioSource.asset("assets/sounds/correct.mp3"));
    await _wrongAnswerPlayer
        .setAudioSource(AudioSource.asset("assets/sounds/wrong_answer.mp3"));
    await _levelFailedPlayer
        .setAudioSource(AudioSource.asset("assets/sounds/level_failed.mp3"));
    await _bubblePopPlayer
        .setAudioSource(AudioSource.asset("assets/sounds/bubble_pop.mp3"));
    await _buttonTapPlayer
        .setAudioSource(AudioSource.asset("assets/sounds/click_button.mp3"));
    await _selectorPlayer
        .setAudioSource(AudioSource.asset("assets/sounds/selector.mp3"));
  }

  void playAlert() {
    _alertPlayer.play();
    _alertPlayer.load();
  }

  void playLevelComplete() {
    _levelCompletePlayer.play();
    _levelCompletePlayer.load();
  }

  void playCorrectAnswer() {
    _correctAnswerPlayer.play();
    _correctAnswerPlayer.load();
  }

  void playWrongAnswer() {
    _wrongAnswerPlayer.play();
    _wrongAnswerPlayer.load();
  }

  void playLevelFailed() {
    _levelFailedPlayer.play();
    _levelFailedPlayer.load();
  }

  void playBubblePop() {
    _bubblePopPlayer.play();
    _bubblePopPlayer.load();
  }

  void playButtonTap() {
    _buttonTapPlayer.play();
    _buttonTapPlayer.load();
  }

  void playLevelSelect() {
    _selectorPlayer.play();
    _selectorPlayer.load();
  }
}
