import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:easy_quiz_game/src/provider/gameplay_provider.dart';
import 'package:easy_quiz_game/src/screens/quiz_selection_dialog.dart';
import 'package:easy_quiz_game/src/widgets/base_scaffold.dart';
import 'package:easy_quiz_game/src/widgets/framed_button.dart';
import 'package:easy_quiz_game/src/widgets/full_screen_dialog.dart';
import 'package:easy_quiz_game/src/widgets/score_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/MenuScreen';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = EasyQuizGameController.of(context);
    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const ScoreBar(),
            const SizedBox(height: 20),
            Image(image: AssetImage(controller.menuLogoPath)),
            const Spacer(),
            FramedButton(
              buttonPath: controller.buttonPath,
              title: 'Play',
              onPress: () {
                final provider = context.read<GameplayProvider>();
                provider.getQuizCategories(controller.quizCategories);
                // Todo: provider.deductPlayCost();
                Navigator.of(context)
                    .push(FullScreenModal(body: const QuizSelectionScreen()));
              },
            ),
            // FramedButton(
            //   buttonPath: controller.buttonPath,
            //   title: 'Question of the Day',
            //   onPress: () =>
            //       Navigator.pushNamed(context, ExtraLifeScreen.routeName),
            // ),
            // FramedButton(
            //   buttonPath: controller.buttonPath,
            //   title: 'Quiz Show',
            //   onPress: () =>
            //       Navigator.pushNamed(context, LevelCompleteScreen.routeName),
            // ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
