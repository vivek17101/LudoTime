import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';

class DiceWidget extends StatelessWidget {
  const DiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Consumer widget rebuilds when diceResult changes
    return Consumer<GameState>(
      builder: (context, gameState, child) {
        return Column(
          children: [
            Text(
              'Current Player: ${gameState.currentPlayer.name}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(gameState.currentPlayer.colorValue),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Dice Result: ${gameState.diceResult}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              // Disable button after rolling until a move is made
              onPressed: gameState.isDiceRolled
                  ? null
                  : () {
                      // Call the rollDice method from the provider
                      context.read<GameState>().rollDice();
                    },
              child: const Text('Roll Dice'),
            ),
          ],
        );
      },
    );
  }
}