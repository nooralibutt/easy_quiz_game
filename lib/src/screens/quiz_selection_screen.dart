import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:easy_quiz_game/src/widgets/framed_button.dart';
import 'package:easy_quiz_game/src/widgets/label_header.dart';
import 'package:flutter/material.dart';

class QuizSelectionScreen extends StatelessWidget {
  const QuizSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = EasyQuizGameController.of(context);
    final theme = Theme.of(context);

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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        'Tap to Choose a Category',
                        style: theme.textTheme.titleLarge,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Expanded(
                            child: CategoryContainer(
                              title: 'Football',
                              img: 'assets/images/coin.png',
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: CategoryContainer(
                              title: 'Football',
                              img: 'assets/images/diamond.png',
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: CategoryContainer(
                              title: 'Football',
                              img: 'assets/images/coin.png',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: FramedButton(
                              buttonPath: controller.buttonPath,
                              title: 'ROLL FREE',
                              onPress: () {},
                            ),
                          ),
                          Expanded(
                            child: FramedButton(
                              buttonPath: controller.buttonPath,
                              title: 'ROLL',
                              onPress: () {},
                            ),
                          ),
                        ],
                      ),
                      FramedButton(
                        buttonPath: controller.buttonPath,
                        title: 'PLAY FOR UNLOCK',
                        onPress: () {},
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

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.img,
    this.title,
  });

  final String? title;
  final String img;

  @override
  Widget build(BuildContext context) {
    final controller = EasyQuizGameController.of(context);
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 13, 8, 8),
      decoration: BoxDecoration(
        color: theme.primaryColorDark.withOpacity(0.4),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          if (title != null && title!.isNotEmpty)
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(title!),
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0, 1],
                begin: const Alignment(1, 1),
                end: const Alignment(1, -1),
                colors: [controller.primaryColor, controller.secondaryColor],
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border:
                  Border.all(color: theme.colorScheme.inversePrimary, width: 1),
            ),
            child: Image(image: AssetImage(img)),
          ),
        ],
      ),
    );
  }
}
