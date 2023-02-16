import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:easy_quiz_game/src/provider/gameplay_provider.dart';
import 'package:easy_quiz_game/src/screens/all_quiz_categories_screen.dart';
import 'package:easy_quiz_game/src/widgets/category_container.dart';
import 'package:easy_quiz_game/src/widgets/framed_button.dart';
import 'package:easy_quiz_game/src/widgets/label_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizSelectionScreen extends StatelessWidget {
  const QuizSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = EasyQuizGameController.of(context);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    gradient: controller.gradient,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: Colors.orange.shade300, width: 8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        'Tap to Choose a Category',
                        style: theme.textTheme.titleLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Consumer<GameplayProvider>(
                        builder: (_, provider, __) {
                          return Row(
                            children: provider.quizCategories
                                    ?.map((e) => Expanded(
                                          child: InkWell(
                                            onTap: () => context
                                                .read<GameplayProvider>()
                                                .onSelectQuizCategory(
                                                    context, e),
                                            child: CategoryContainer(
                                              title: e.name.toUpperCase(),
                                              img: e.iconImage,
                                            ),
                                          ),
                                        ))
                                    .toList() ??
                                [],
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: FramedButton(
                          buttonPath: controller.buttonPath,
                          title: 'ROLL FREE',
                          onPress: () => context
                              .read<GameplayProvider>()
                              .getQuizCategories(controller.quizCategories),
                        ),
                      ),
                      FramedButton(
                        buttonPath: controller.buttonPath,
                        title: 'PLAY FOR UNLOCK',
                        onPress: () => Navigator.pushReplacementNamed(
                            context, AllQuizCategoriesScreen.routeName),
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
              child: LabelHeader(title: 'Select'),
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
