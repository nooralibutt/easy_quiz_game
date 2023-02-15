import 'package:collection/collection.dart';
import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:easy_quiz_game/src/provider/gameplay_provider.dart';
import 'package:easy_quiz_game/src/widgets/category_container.dart';
import 'package:easy_quiz_game/src/widgets/framed_button.dart';
import 'package:easy_quiz_game/src/widgets/label_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevelProgressDialog extends StatelessWidget {
  const LevelProgressDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = EasyQuizGameController.of(context);
    final provider = context.read<GameplayProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: controller.gradient,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: Colors.orange.shade300, width: 8),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Row(
                        children: const [
                          Expanded(
                            child: Image(
                              image: AssetImage('assets/images/box.png'),
                            ),
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.add),
                          SizedBox(width: 20),
                          Expanded(
                            child: Image(
                              image: AssetImage('assets/images/diamond.png'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 5,
                        children: provider.categoryQuizzes?.mapIndexed((i, e) {
                              String img = 'assets/images/ques_mark.png';
                              if (i < provider.completedCount) {
                                img = 'assets/images/done.png';
                              }
                              return SizedBox(
                                  width: 100,
                                  child: CategoryContainer(img: img));
                            }).toList() ??
                            [],
                      ),
                      const SizedBox(height: 20),
                      FramedButton(
                        buttonPath: controller.buttonPath,
                        title: 'Next',
                        onPress: () => provider.onNextQuestion(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
            const Positioned(
              left: 75,
              right: 75,
              child: LabelHeader(title: 'Level'),
            ),
            Positioned(
              right: 10,
              top: 20,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
