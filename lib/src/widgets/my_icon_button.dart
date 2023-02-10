import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.onPress,
    required this.icon,
  });

  final VoidCallback onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final controller = EasyQuizGameController.of(context);

    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: controller.gradient,
          border: Border.all(color: controller.secondaryColor, width: 2),
        ),
        child: Icon(icon),
      ),
    );
  }
}
