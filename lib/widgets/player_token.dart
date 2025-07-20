import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/player.dart';
import '../models/game_state.dart';

class PlayerToken extends StatelessWidget {
  final Player player;
  final int tokenIndex;

  const PlayerToken({
    Key? key,
    required this.player,
    required this.tokenIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final gameState = context.read<GameState>();
        // Only allow moving if the current player owns this token and the dice has been rolled
        if (gameState.currentPlayer.id == player.id && gameState.isDiceRolled) {
          gameState.moveToken(player.id, tokenIndex);
        }
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Color(player.colorValue),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            '${tokenIndex + 1}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}