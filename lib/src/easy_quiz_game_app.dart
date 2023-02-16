import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:easy_quiz_game/src/models/quiz_category.dart';
import 'package:easy_quiz_game/src/provider/gameplay_provider.dart';
import 'package:easy_quiz_game/src/provider/prefs.dart';
import 'package:easy_quiz_game/src/screens/all_quiz_categories_screen.dart';
import 'package:easy_quiz_game/src/screens/extra_life_screen.dart';
import 'package:easy_quiz_game/src/screens/level_complete_screen.dart';
import 'package:easy_quiz_game/src/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/quiz_gameplay_screen.dart';

class EasyQuizGameApp extends StatelessWidget {
  /// This is the main menu Logo path
  final String menuLogoPath;

  /// This will be added as a background image with blur effect
  final String? bgImagePath;

  /// This will be added as a button image
  final String buttonPath;

  /// This will be added as a label image
  final String labelPath;

  /// This will be primary gradient
  final Gradient gradient;

  /// This will be primary color
  final Color primaryColor;

  /// This will be secondary color
  final Color secondaryColor;

  /// This will be the quiz data that you have to provide
  final List<QuizCategory> quizCategories;

  /// [placementBuilder] is used to build your custom widget at specific places
  final PlacementBuilder? placementBuilder;

  /// [onTapEvent] will be call on every event preformed by the user
  final EventActionCallback? onTapEvent;

  const EasyQuizGameApp({
    Key? key,
    required this.menuLogoPath,
    this.bgImagePath,
    this.onTapEvent,
    this.placementBuilder,
    required this.buttonPath,
    required this.labelPath,
    required this.gradient,
    required this.primaryColor,
    required this.secondaryColor,
    required this.quizCategories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = EasyQuizGameController(
      menuLogoPath: menuLogoPath,
      placementBuilder: placementBuilder,
      onTapEvent: onTapEvent,
      parentContext: context,
      bgImagePath: bgImagePath,
      buttonPath: buttonPath,
      labelPath: labelPath,
      gradient: gradient,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,
      quizCategories: quizCategories,

      /// Package has its own navigation
      child: ChangeNotifierProvider(
        create: (BuildContext context) => GameplayProvider(),
        child: Navigator(
          initialRoute: MenuScreen.routeName,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case MenuScreen.routeName:
                return _generatePage(const MenuScreen());
              case QuizGameplayScreen.routeName:
                return _generatePage(const QuizGameplayScreen());
              case ExtraLifeScreen.routeName:
                return _generatePage(const ExtraLifeScreen());
              case LevelCompleteScreen.routeName:
                return _generatePage(const LevelCompleteScreen());
              case AllQuizCategoriesScreen.routeName:
                return _generatePage(const AllQuizCategoriesScreen());
            }
            return null;
          },
        ),
      ),
    );
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return child;
        }

        return const Center(child: CircularProgressIndicator.adaptive());
      },
      future: Prefs.instance.init(),
    );
  }

  static Route _generatePage(child) => MaterialPageRoute(builder: (_) => child);
}
