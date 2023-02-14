import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    Key? key,
    this.whenTimeExpires,
    this.quizTimeInSec = 30,
  }) : super(key: key);
  final int quizTimeInSec;
  final VoidCallback? whenTimeExpires;

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    final duration = Duration(seconds: widget.quizTimeInSec);
    _controller = AnimationController(
      vsync: this,
      reverseDuration: duration,
    );
    _controller.reverse(from: duration.inSeconds.toDouble());
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        widget.whenTimeExpires?.call();
      }
    });
  }

  String get timerDisplayString {
    final duration = _controller.reverseDuration! * _controller.value;
    return formatHHMMSS(duration.inSeconds);
  }

  String formatHHMMSS(int seconds) {
    final hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();

    final hoursStr = (hours).toString().padLeft(2, '0');
    final minutesStr = (minutes).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: _controller,
          builder: (_, Widget? child) {
            return Text(
              timerDisplayString,
              style: Theme.of(context).textTheme.titleLarge,
            );
          }),
    );
  }
}
