import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:easy_quiz_game/src/widgets/base_scaffold.dart';
import 'package:easy_quiz_game/src/widgets/framed_button.dart';
import 'package:easy_quiz_game/src/widgets/score_bar.dart';
import 'package:flutter/material.dart';

class QuizGameplayScreen extends StatelessWidget {
  static const routeName = '/QuizGameplayScreen';

  const QuizGameplayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = EasyQuizGameController.of(context);
    final theme = Theme.of(context);

    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const ScoreBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: controller.gradient,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        border:
                            Border.all(color: Colors.orange.shade300, width: 8),
                      ),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.'
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.'
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.'
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis.',
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FramedButton(
                      buttonPath: controller.buttonPath,
                      title: 'Option 1',
                      onPress: () {},
                    ),
                    FramedButton(
                      buttonPath: controller.buttonPath,
                      title: 'Option 2',
                      onPress: () => Navigator.pushNamed(
                          context, QuizGameplayScreen.routeName),
                    ),
                    FramedButton(
                      buttonPath: controller.buttonPath,
                      title: 'Option 3',
                      onPress: () {},
                    ),
                    FramedButton(
                      buttonPath: controller.buttonPath,
                      title: 'Option 4',
                      onPress: () {},
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
}
