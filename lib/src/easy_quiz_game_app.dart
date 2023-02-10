import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:easy_quiz_game/src/screens/extra_life_screen.dart';
import 'package:easy_quiz_game/src/screens/menu_screen.dart';
import 'package:flutter/material.dart';

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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyQuizGameController(
      menuLogoPath: menuLogoPath,
      placementBuilder: placementBuilder,
      onTapEvent: onTapEvent,
      context: context,
      bgImagePath: bgImagePath,
      buttonPath: buttonPath,
      labelPath: labelPath,
      gradient: gradient,
      primaryColor: primaryColor,
      secondaryColor: secondaryColor,

      /// Package has its own navigation
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
          }
          return null;
        },
      ),
    );
  }

  Route _generatePage(child) => MaterialPageRoute(builder: (_) => child);

  static void launchApp(
    BuildContext context, {
    /// This is the main menu Logo path
    required final String menuLogoPath,

    /// This will be added as a background image with blur effect
    final String? bgImagePath,

    /// This will be added as a button image
    required final String buttonPath,

    /// This will be added as a label image
    required final String labelPath,

    /// This will be primary gradient
    required final Gradient gradient,

    /// This will be primary color
    required final Color primaryColor,

    /// This will be secondary color
    required final Color secondaryColor,

    /// [placementBuilder] is used to build your custom widget at specific places
    final PlacementBuilder? placementBuilder,

    /// [onTapEvent] will be call on every event preformed by the user
    final EventActionCallback? onTapEvent,
  }) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) => Scaffold(
            body: EasyQuizGameApp(
              menuLogoPath: menuLogoPath,
              bgImagePath: bgImagePath,
              placementBuilder: placementBuilder,
              onTapEvent: onTapEvent,
              buttonPath: buttonPath,
              labelPath: labelPath,
              gradient: gradient,
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
            ),
          ),
        ),
      );
}
