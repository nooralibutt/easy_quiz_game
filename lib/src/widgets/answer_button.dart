import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final VoidCallback onTapAnswer;
  final String title;
  const AnswerButton(
      {super.key, required this.onTapAnswer, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapAnswer,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.orange.shade300,
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
                color: Colors.orange.shade300,
                spreadRadius: -8.0,
                blurRadius: 30,
              ),
            ],
          ),
          child: Text(title),
        ),
      ),
    );
  }
}
