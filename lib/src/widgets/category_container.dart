import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key, required this.img, this.title});

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
