import 'package:flutter/material.dart';
import 'package:new_super_jumper/high_scores.dart';
import 'package:new_super_jumper/my_game.dart';
import 'package:new_super_jumper/navigation/routes.dart';
import 'package:new_super_jumper/ui/widgets/my_button.dart';
import 'package:new_super_jumper/ui/widgets/my_text.dart';

class GameOverMenu extends StatelessWidget {
  final MyGame game;

  const GameOverMenu({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.black38,
      child: Center(
        child: AspectRatio(
          aspectRatio: 9 / 19.5,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: height * .15),
                const MyText(
                  'Game Over!',
                  fontSize: 56,
                ),
                Table(
                  // border: TableBorder.all(),
                  columnWidths: const {
                    0: FlexColumnWidth(.2),
                    1: FlexColumnWidth(.5),
                    2: FlexColumnWidth(.2),
                    3: FlexColumnWidth(.1),
                  },
                  children: [
                    TableRow(
                      children: [
                        const SizedBox(),
                        const MyText('Score'),
                        MyText(game.score.toString()),
                        const SizedBox(),
                      ],
                    ),
                    TableRow(
                      children: [
                        const SizedBox(),
                        const MyText('Best Score'),
                        MyText('${HighScores.highScores[0]}'),
                        const SizedBox(),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 40),
                MyButton(
                  'Try Again',
                  onPressed: () => context.pushAndRemoveUntil(Routes.game),
                ),
                const SizedBox(height: 40),
                MyButton(
                  'Menu',
                  onPressed: () => context.pushAndRemoveUntil(Routes.main),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
