import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static final Prefs _instance = Prefs._internal();
  static Prefs get instance => _instance;
  Prefs._internal();

  factory Prefs() => _instance;

  static late SharedPreferences _prefs;
  static const _coins = 'coins';
  static const _diamonds = 'diamonds';
  static const _extraLifeUsedTime = 'extraLifeUsedTime';

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  int getCoins() => _prefs.getInt(_coins) ?? 0;
  void updateCoins(int reward) => _prefs.setInt(_coins, reward);

  int getDiamonds() => _prefs.getInt(_diamonds) ?? 0;
  void updateDiamonds(int reward) => _prefs.setInt(_diamonds, reward);

  bool isCategoryLocked(String name) => _prefs.getBool(name) ?? true;
  void unlockedCategory(String name) => _prefs.setBool(name, false);

  DateTime getLastLifeUsedTime() {
    final time = _prefs.getInt(_extraLifeUsedTime) ??
        DateTime.now()
            .subtract(const Duration(minutes: 5))
            .millisecondsSinceEpoch;
    return DateTime.fromMillisecondsSinceEpoch(time);
  }

  void setLastLifeUsedTime() =>
      _prefs.setInt(_extraLifeUsedTime, DateTime.now().millisecondsSinceEpoch);
}
