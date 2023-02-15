import 'package:easy_quiz_game/src/models/quiz_category.dart';
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
    final correctAnswer = quizzes?[completedCount]
        .options[quizzes?[completedCount].correctIndex ?? 0];
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
}
