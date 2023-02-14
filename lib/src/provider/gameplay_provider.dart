import 'package:flutter/cupertino.dart';

class GameplayProvider with ChangeNotifier {
  bool isAnswerPressed = false;

  void onTapAnswer() {
    isAnswerPressed = true;
    notifyListeners();
  }
}
