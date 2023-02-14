import 'package:easy_quiz_game/src/provider/gameplay_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnswerButton extends StatefulWidget {
  final VoidCallback onTapAnswer;
  final String title;
  final String correctAnswer;
  const AnswerButton({
    super.key,
    required this.onTapAnswer,
    required this.title,
    required this.correctAnswer,
  });

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTapAnswer,
      child: Selector<GameplayProvider, bool>(
        selector: (context, provider) => provider.isAnswerPressed,
        builder: (context, value, child) {
          Color buttonColor = Colors.orange.shade300;
          if (value) {
            if (widget.title == widget.correctAnswer) {
              buttonColor = Colors.green.shade700;
            } else {
              buttonColor = Colors.red.shade700;
            }
          }

          return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(23),
            ),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  const BoxShadow(color: Colors.black38),
                  BoxShadow(
                    color: buttonColor,
                    spreadRadius: -8.0,
                    blurRadius: 30,
                  ),
                ],
              ),
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          );
        },
      ),
    );
  }
}
