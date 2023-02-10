import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:flutter/material.dart';

class FramedButton extends StatelessWidget {
  const FramedButton({
    super.key,
    this.buttonPath,
    required this.title,
    required this.onPress,
  });

  final String? buttonPath;
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final path = buttonPath ?? EasyQuizGameController.of(context).buttonPath;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width * 0.7,
        height: 80,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path)),
        ),
        child: FittedBox(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
