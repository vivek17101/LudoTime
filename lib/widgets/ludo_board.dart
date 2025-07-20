import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import 'player_token.dart';

class LudoBoard extends StatelessWidget {
  const LudoBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameState>(
      builder: (context, gameState, child) {
        return Container(
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            color: Colors.green[100],
          ),
          // Stack allows us to place tokens on top of the board
          child: Stack(
            children: [
              // You would place your board image or custom painter here as the base layer
              // For now, it's just a colored container.

              // This part dynamically builds the tokens from the game state
              ..._buildPlayerTokens(gameState),
            ],
          ),
        );
      },
    );
  }

  // Helper function to create a list of all player tokens
  List<Widget> _buildPlayerTokens(GameState gameState) {
    List<Widget> tokenWidgets = [];
    for (var player in gameState.players) {
      for (int i = 0; i < player.tokens.length; i++) {
        // In a real app, the position would be calculated based on the token's value
        // This is a simplified example of placing tokens
        tokenWidgets.add(
          Positioned(
            // Placeholder positioning logic
            top: 50.0 * (player.id + 1),
            left: 50.0 * (i + 1),
            child: PlayerToken(
              player: player,
              tokenIndex: i,
            ),
          ),
        );
      }
    }
    return tokenWidgets;
  }
}