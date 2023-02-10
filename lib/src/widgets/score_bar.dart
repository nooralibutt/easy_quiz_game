import 'package:easy_quiz_game/src/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';

class ScoreBar extends StatelessWidget {
  const ScoreBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyIconButton(onPress: () {}, icon: Icons.menu),
        const SizedBox(width: 10),
        Expanded(
          child: ScoreContainer(
            leadingImg: 'assets/images/coin.png',
            score: '100',
            onPress: () {},
          ),
        ),
        const SizedBox(width: 10),
        const Image(
          image: AssetImage('assets/images/coin.png'),
          width: 50,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ScoreContainer(
            leadingImg: 'assets/images/diamond.png',
            score: '20',
            onPress: () {},
          ),
        ),
        const SizedBox(width: 10),
        MyIconButton(onPress: () {}, icon: Icons.question_mark_rounded),
      ],
    );
  }
}

class ScoreContainer extends StatelessWidget {
  final String leadingImg;
  final String score;
  final VoidCallback onPress;
  const ScoreContainer({
    super.key,
    required this.leadingImg,
    required this.score,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 25,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: const [0, 1],
            begin: const Alignment(1, 1),
            end: const Alignment(1, -1),
            colors: [theme.secondaryHeaderColor, theme.primaryColorDark],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.orange),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(image: AssetImage(leadingImg)),
            Text(score),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.green, shape: BoxShape.circle),
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
