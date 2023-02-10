import 'package:easy_quiz_game/src/widgets/base_scaffold.dart';
import 'package:easy_quiz_game/src/widgets/label_header.dart';
import 'package:flutter/material.dart';

class LevelCompleteScreen extends StatelessWidget {
  static const routeName = '/LevelCompleteScreen';

  const LevelCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [LabelHeader(title: '')],
        ),
      ),
    );
  }
}
