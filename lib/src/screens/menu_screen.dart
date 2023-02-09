import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:easy_quiz_game/src/widgets/base_scaffold.dart';
import 'package:easy_quiz_game/src/widgets/framed_button.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/MenuScreen';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = EasyQuizGameController.of(context);
    return BaseScaffold(
      imagePath: controller.bgImagePath,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image(image: AssetImage(controller.menuLogoPath)),
            const Spacer(),
            FramedButton(
              buttonPath: controller.buttonPath,
              title: 'Play',
              onPress: () {},
            ),
            FramedButton(
              buttonPath: controller.buttonPath,
              title: 'Question of the Day',
              onPress: () {},
            ),
            FramedButton(
              buttonPath: controller.buttonPath,
              title: 'Quiz Show',
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
