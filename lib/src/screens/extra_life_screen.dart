import 'package:easy_quiz_game/src/provider/audio_manager.dart';
import 'package:easy_quiz_game/src/provider/gameplay_provider.dart';
import 'package:easy_quiz_game/src/provider/prefs.dart';
import 'package:easy_quiz_game/src/screens/quiz_gameplay_screen.dart';
import 'package:easy_quiz_game/src/widgets/base_scaffold.dart';
import 'package:easy_quiz_game/src/widgets/framed_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExtraLifeScreen extends StatelessWidget {
  static const routeName = '/ExtraLifeScreen';

  const ExtraLifeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/images/life.png'),
              height: 50,
            ),
            const SizedBox(height: 40),
            Text(
              'Use your extra life and receive a new question',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            const Image(
              image: AssetImage('assets/images/extra_life.png'),
            ),
            const Spacer(),
            FramedButton(
                title: 'USE EXTRA LIFE',
                onPress: () {
                  context.read<GameplayProvider>().isAnswerPressed = false;
                  Prefs.instance.setLastLifeUsedTime();
                  AudioManager.instance.playButtonTap();
                  Navigator.pushReplacementNamed(
                      context, QuizGameplayScreen.routeName);
                }),
            const SizedBox(height: 10),
            FramedButton(
                title: 'END QUIZ',
                onPress: () {
                  AudioManager.instance.playButtonTap();
                  Navigator.popUntil(context, (route) => route.isFirst);
                }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
