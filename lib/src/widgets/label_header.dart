import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:flutter/material.dart';

class LabelHeader extends StatelessWidget {
  final String title;
  const LabelHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final controller = EasyQuizGameController.of(context);
    final theme = Theme.of(context);

    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(controller.labelPath),
        ),
      ),
      child: FittedBox(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            child: Text(
              title,
              style: theme.textTheme.headlineMedium!.copyWith(
                  color: theme.primaryColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
