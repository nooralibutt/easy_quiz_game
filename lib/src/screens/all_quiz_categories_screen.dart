import 'package:easy_quiz_game/easy_quiz_game.dart';
import 'package:easy_quiz_game/src/easy_quiz_game_controller.dart';
import 'package:easy_quiz_game/src/provider/gameplay_provider.dart';
import 'package:easy_quiz_game/src/provider/prefs.dart';
import 'package:easy_quiz_game/src/widgets/base_scaffold.dart';
import 'package:easy_quiz_game/src/widgets/category_container.dart';
import 'package:easy_quiz_game/src/widgets/dialog_frame.dart';
import 'package:easy_quiz_game/src/widgets/framed_button.dart';
import 'package:easy_quiz_game/src/widgets/full_screen_dialog.dart';
import 'package:easy_quiz_game/src/widgets/score_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllQuizCategoriesScreen extends StatelessWidget {
  static const routeName = '/AllQuizCategoriesScreen';
  const AllQuizCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const ScoreBar(),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _buildCategoryList(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<StatelessWidget> _buildCategoryList(BuildContext context) {
    final controller = EasyQuizGameController.of(context);
    final provider = context.read<GameplayProvider>();

    final list = controller.quizCategories.map((e) {
      bool isLocked = Prefs.instance.isCategoryLocked(e.name);
      if (isLocked && e.difficulty != QuizDifficulty.beginner) {
        return Badge(
          label: const Icon(Icons.lock, size: 15),
          child: CategoryCard(
            category: e,
            onTap: () => Navigator.of(context).push(
              FullScreenModal(
                body: DialogFrame(
                  title: e.name,
                  body: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Image(
                          image: AssetImage('assets/images/diamond.png')),
                      const SizedBox(height: 20),
                      const Text('50'),
                      const SizedBox(height: 20),
                      FramedButton(
                        buttonPath: controller.buttonPath,
                        title: 'Unlock Category',
                        onPress: () {
                          provider.unlockWithDiamond(context, e.name);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }

      return CategoryCard(
        category: e,
        onTap: () => provider.onSelectQuizCategory(context, e),
      );
    }).toList();

    return list;
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    this.onTap,
    required this.category,
  });

  final VoidCallback? onTap;
  final QuizCategory category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: CategoryContainer(
          title: category.name.toUpperCase(),
          img: category.iconImage,
        ),
      ),
    );
  }
}
