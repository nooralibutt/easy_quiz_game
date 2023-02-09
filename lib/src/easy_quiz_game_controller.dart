import 'package:easy_quiz_game/src/models/enums.dart';
import 'package:flutter/material.dart';

typedef PlacementBuilder = Widget Function(BuildContext, QuizPlacement);
typedef EventActionCallback = void Function(BuildContext, QuizEventAction);

class EasyQuizGameController extends InheritedWidget {
  const EasyQuizGameController({
    super.key,
    required this.menuLogoPath,
    this.bgImagePath,
    required this.buttonPath,
    required this.labelPath,
    required super.child,
    this.placementBuilder,
    this.onTapEvent,
    required this.context,
  });

  /// This is the main menu Logo path
  final String menuLogoPath;

  /// This will be added as a background image with blur effect
  final String? bgImagePath;

  /// This will be added as a button image
  final String buttonPath;

  /// This will be added as a label image
  final String labelPath;

  /// [placementBuilder] is used to build your custom widget at specific places
  final PlacementBuilder? placementBuilder;

  /// [onTapEvent] will be call on every event preformed by the user
  final EventActionCallback? onTapEvent;

  final BuildContext context;

  static EasyQuizGameController? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<EasyQuizGameController>();
  }

  static EasyQuizGameController of(BuildContext context) {
    final EasyQuizGameController? result = maybeOf(context);
    assert(result != null, 'No Quiz Game found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(EasyQuizGameController oldWidget) =>
      menuLogoPath != oldWidget.menuLogoPath;
}
