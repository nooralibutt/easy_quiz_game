import 'package:easy_quiz_game/easy_quiz_game.dart';
import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:easy_quiz_game/src/provider/gameplay_provider.dart';
import 'package:easy_quiz_game/src/widgets/answer_button.dart';
import 'package:easy_quiz_game/src/widgets/base_scaffold.dart';
import 'package:easy_quiz_game/src/widgets/image_widget.dart';
import 'package:easy_quiz_game/src/widgets/score_bar.dart';
import 'package:easy_quiz_game/src/widgets/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizGameplayScreen extends StatelessWidget {
  static const routeName = '/QuizGameplayScreen';

  final Quiz quiz;
  const QuizGameplayScreen({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = EasyQuizGameController.of(context);

    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const ScoreBar(),
            const SizedBox(height: 10),
            const TimerWidget(),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: controller.gradient,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        border:
                            Border.all(color: Colors.orange.shade300, width: 8),
                      ),
                      child: getQuestion(context),
                    ),
                    const SizedBox(height: 20),
                    ButtonListView(
                      options: quiz.options,
                      correctIndex: quiz.correctIndex,
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getQuestion(BuildContext context) {
    if (quiz.questionType == QuizQuestionType.text) {
      final theme = Theme.of(context);
      return Text(
        quiz.question,
        style: theme.textTheme.titleMedium,
      );
    } else {
      return ImageWidget(
        imgPath: quiz.question,
        fit: BoxFit.contain,
      );
    }
  }
}

class ButtonListView extends StatelessWidget {
  final List<String> options;
  final int correctIndex;
  const ButtonListView(
      {Key? key, required this.options, required this.correctIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<GameplayProvider>();

    return Column(
      children: options
          .map((e) => AnswerButton(
                title: e,
                onTapAnswer: provider.onTapAnswer,
                correctAnswer: options[correctIndex],
              ))
          .toList(),
    );
  }
}
