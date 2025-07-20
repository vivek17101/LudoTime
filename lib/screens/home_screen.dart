import 'package.flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../widgets/ludo_board.dart';
import '../widgets/dice_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ludo Game'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Call the reset method from the GameState provider
              context.read<GameState>().resetGame();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // The Ludo board will take up most of the space
            const Expanded(
              child: LudoBoard(),
            ),
            // The dice and player info widget
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: DiceWidget(),
            ),
          ],
        ),
      ),
    );
  }
}