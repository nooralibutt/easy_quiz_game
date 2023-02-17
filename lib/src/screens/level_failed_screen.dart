import 'package:easy_quiz_game/src/provider/audio_manager.dart';
import 'package:easy_quiz_game/src/provider/gameplay_provider.dart';
import 'package:easy_quiz_game/src/widgets/base_scaffold.dart';
import 'package:easy_quiz_game/src/widgets/framed_button.dart';
import 'package:easy_quiz_game/src/widgets/label_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LevelFailedScreen extends StatelessWidget {
  static const routeName = '/LevelFailedScreen';

  const LevelFailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<GameplayProvider>();
    final theme = Theme.of(context);

    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const LabelHeader(title: "DON'T GIVE UP"),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Image(
                image: AssetImage('assets/images/gem_box.png'),
              ),
            ),
            const SizedBox(height: 20),
            Text('Stop now and lose your rewards',
                style: theme.textTheme.titleLarge),
            const Spacer(),
            FramedButton(
                title: 'END QUIZ',
                onPress: () {
                  AudioManager.instance.playButtonTap();
                  Navigator.popUntil(context, (route) => route.isFirst);
                }),
            Badge(
                label: Row(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/diamond.png'),
                      height: 15,
                    ),
                    Text('20', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                child: FramedButton(
                    title: 'CONTINUE',
                    onPress: () => provider.continueOnLevelFailed(context))),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
