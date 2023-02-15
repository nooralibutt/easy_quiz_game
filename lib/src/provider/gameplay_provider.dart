import 'package:easy_quiz_game/src/models/quiz_category.dart';
import 'package:easy_quiz_game/src/provider/prefs.dart';
import 'package:easy_quiz_game/src/screens/extra_life_screen.dart';
import 'package:easy_quiz_game/src/screens/level_complete_screen.dart';
import 'package:easy_quiz_game/src/screens/level_progress_dialog.dart';
import 'package:easy_quiz_game/src/screens/quiz_gameplay_screen.dart';
import 'package:easy_quiz_game/src/widgets/full_screen_dialog.dart';
import 'package:flutter/material.dart';

class GameplayProvider with ChangeNotifier {
  QuizCategory? quizCategory;
  List<Quiz>? quizzes;
  Quiz? quiz;
  int completedCount = 0;
  bool isAnswerPressed = false;
  int coins = 0;
  int diamonds = 0;

  GameplayProvider()
      : coins = Prefs.instance.getCoins(),
        diamonds = Prefs.instance.getDiamonds();

  void onSelectQuizCategory(BuildContext context, QuizCategory e) {
    e.quizzes.shuffle();
    quizzes = e.quizzes.take(3).toList();
    Navigator.of(context)
        .pushReplacement(FullScreenModal(body: const LevelProgressDialog()));
  }

  void onNextQuestion(BuildContext context) {
    isAnswerPressed = false;
    quiz = quizzes?[completedCount];
    Navigator.pushReplacementNamed(context, QuizGameplayScreen.routeName);
  }

  void onTapAnswer(BuildContext context, String selectedAnswer) {
    const duration = Duration(seconds: 1);
    isAnswerPressed = true;
    notifyListeners();

    final currentQuiz = quizzes?[completedCount];
    final correctAnswer = currentQuiz?.options[currentQuiz.correctIndex];
    if (selectedAnswer != correctAnswer) {
      Future.delayed(
          duration,
          () => Navigator.pushReplacementNamed(
              context, ExtraLifeScreen.routeName));
    } else {
      completedCount++;
      if (completedCount < quizzes!.length) {
        Future.delayed(
            duration,
            () => Navigator.of(context).pushReplacement(
                FullScreenModal(body: const LevelProgressDialog())));
      } else {
        Future.delayed(
            duration,
            () => Navigator.pushReplacementNamed(
                context, LevelCompleteScreen.routeName));
      }
    }
  }

  void earnReward() {
    diamonds += 5;
    coins += 20;
    Prefs.instance.updateDiamonds(diamonds);
    Prefs.instance.updateCoins(coins);
    notifyListeners();
  }
}
