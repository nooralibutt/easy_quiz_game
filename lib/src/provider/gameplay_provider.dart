import 'package:easy_quiz_game/src/models/quiz_category.dart';
import 'package:easy_quiz_game/src/provider/my_audio_player.dart';
import 'package:easy_quiz_game/src/provider/prefs.dart';
import 'package:easy_quiz_game/src/screens/extra_life_screen.dart';
import 'package:easy_quiz_game/src/screens/level_complete_screen.dart';
import 'package:easy_quiz_game/src/screens/level_failed_screen.dart';
import 'package:easy_quiz_game/src/screens/level_progress_dialog.dart';
import 'package:easy_quiz_game/src/screens/quiz_gameplay_screen.dart';
import 'package:easy_quiz_game/src/widgets/dialog_frame.dart';
import 'package:easy_quiz_game/src/widgets/full_screen_dialog.dart';
import 'package:flutter/material.dart';

class GameplayProvider with ChangeNotifier {
  List<QuizCategory>? quizCategories;
  QuizCategory? selectedQuizCategory;
  List<Quiz>? categoryQuizzes;
  Quiz? selectedQuiz;
  int completedCount = 0;
  bool isAnswerPressed = false;
  int coins = 0;
  int diamonds = 0;

  GameplayProvider()
      : coins = Prefs.instance.getCoins(),
        diamonds = Prefs.instance.getDiamonds();

  void getQuizCategories(List<QuizCategory> categories) {
    categories.shuffle();
    quizCategories = categories.take(3).toList();
    MyAudioPlayer.instance.playButtonTap();
    notifyListeners();
  }

  void onSelectQuizCategory(BuildContext context, QuizCategory e) {
    MyAudioPlayer.instance.playButtonTap();
    isAnswerPressed = false;
    completedCount = 0;
    e.quizzes.shuffle();
    categoryQuizzes = e.quizzes.take(3).toList();
    Navigator.of(context)
        .pushReplacement(FullScreenModal(body: const LevelProgressDialog()));
  }

  void onNextQuestion(BuildContext context) {
    MyAudioPlayer.instance.playButtonTap();
    isAnswerPressed = false;
    selectedQuiz = categoryQuizzes?[completedCount];
    Navigator.pushReplacementNamed(context, QuizGameplayScreen.routeName);
  }

  void onTapAnswer(BuildContext context, String selectedAnswer) {
    const duration = Duration(seconds: 1);
    isAnswerPressed = true;
    notifyListeners();

    final currentQuiz = categoryQuizzes?[completedCount];
    final correctAnswer = currentQuiz?.options[currentQuiz.correctIndex];
    if (selectedAnswer != correctAnswer) {
      levelEnd(context);
    } else {
      completedCount++;
      if (completedCount < categoryQuizzes!.length) {
        MyAudioPlayer.instance.playCorrectAnswer();
        Future.delayed(
            duration,
            () => Navigator.of(context).pushReplacement(
                FullScreenModal(body: const LevelProgressDialog())));
      } else {
        MyAudioPlayer.instance.playWrongAnswer();
        Future.delayed(
            duration,
            () => Navigator.pushReplacementNamed(
                context, LevelCompleteScreen.routeName));
      }
    }
  }

  void earnReward() {
    diamonds += 50;
    coins += 200;
    Prefs.instance.updateDiamonds(diamonds);
    Prefs.instance.updateCoins(coins);
    notifyListeners();
  }

  void deductPlayCost() {
    if (coins <= 0) {
      return;
    }
    coins -= 10;
    Prefs.instance.updateCoins(coins);
    notifyListeners();
  }

  void unlockWithDiamond(BuildContext context, String categoryNameToUnlock) {
    MyAudioPlayer.instance.playButtonTap();
    if (diamonds <= 0) {
      Navigator.of(context).pushReplacement(
        FullScreenModal(
          body: DialogFrame(
            title: 'Sorry',
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Sorry you do not have enough gems. Please Try Later !!!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),
        ),
      );
    } else {
      diamonds -= 20;
      Prefs.instance.updateDiamonds(diamonds);
      Prefs.instance.unlockedCategory(categoryNameToUnlock);
      Navigator.pop(context);
      notifyListeners();
    }
  }

  void buyCoins(BuildContext context, int coins, int gems) {
    MyAudioPlayer.instance.playButtonTap();

    if (diamonds <= 0 || diamonds < gems) {
      Navigator.of(context).pushReplacement(
        FullScreenModal(
          body: DialogFrame(
            title: 'Sorry',
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Sorry you do not have enough gems. Please Try Later !!!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),
        ),
      );
    } else {
      diamonds -= gems;
      this.coins += coins;
      Prefs.instance.updateDiamonds(diamonds);
      Prefs.instance.updateCoins(this.coins);
      Navigator.pop(context);
      notifyListeners();
    }
  }

  void levelEnd(BuildContext context) {
    MyAudioPlayer.instance.playLevelFailed();

    const duration = Duration(seconds: 1);
    final currentTime = DateTime.now();
    final lastLifeUsedTime = Prefs.instance.getLastLifeUsedTime();
    if (currentTime.difference(lastLifeUsedTime).inMinutes >= 5) {
      Future.delayed(
          duration,
          () => Navigator.pushReplacementNamed(
              context, ExtraLifeScreen.routeName));
    } else {
      Future.delayed(
          duration,
          () => Navigator.pushReplacementNamed(
              context, LevelFailedScreen.routeName));
    }
  }

  continueOnLevelFailed(BuildContext context) {
    MyAudioPlayer.instance.playButtonTap();
    isAnswerPressed = false;
    if (diamonds <= 0 || diamonds < 50) {
      Navigator.of(context).pushReplacement(
        FullScreenModal(
          body: DialogFrame(
            title: 'Sorry',
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Sorry you do not have enough gems. Please Try Later !!!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
          ),
        ),
      );
    } else {
      Navigator.pushReplacementNamed(context, QuizGameplayScreen.routeName);
    }
  }
}
