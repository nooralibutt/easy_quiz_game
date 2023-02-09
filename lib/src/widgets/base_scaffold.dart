import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;

  const BaseScaffold({
    Key? key,
    this.appBar,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = EasyQuizGameController.of(context);

    return Scaffold(
      appBar: appBar,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: controller.bgImagePath != null
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(controller.bgImagePath!),
                  fit: BoxFit.cover,
                ),
              )
            : null,
        child: SafeArea(bottom: false, child: body),
      ),
    );
  }
}
