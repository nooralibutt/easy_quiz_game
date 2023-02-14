import 'package:easy_quiz_game/src/models/enums.dart';

class QuizCategory {
  final String name;
  final String description;
  final String iconImage;
  final QuizDifficulty difficulty;
  final List<Quiz> quizzes;

  QuizCategory({
    required this.name,
    required this.description,
    required this.iconImage,
    required this.difficulty,
    required this.quizzes,
  });
}

class Quiz {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String hint;
  final QuizQuestionType questionType;
  final QuizDifficulty difficulty;

  Quiz({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.hint,
    required this.questionType,
    required this.difficulty,
  });
}
