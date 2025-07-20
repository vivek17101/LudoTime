import 'package:flutter/foundation.dart';
import 'dart:math';
import 'player.dart';

class GameState with ChangeNotifier {
  final List<Player> _players = [
    Player(id: 0, name: 'Red', colorValue: 0xFFFF0000),
    Player(id: 1, name: 'Green', colorValue: 0xFF00FF00),
    Player(id: 2, name: 'Yellow', colorValue: 0xFFFFFF00),
    Player(id: 3, name: 'Blue', colorValue: 0xFF0000FF),
  ];

  int _diceResult = 1;
  int _currentPlayerIndex = 0;
  bool _isDiceRolled = false;

  List<Player> get players => _players;
  int get diceResult => _diceResult;
  Player get currentPlayer => _players[_currentPlayerIndex];
  bool get isDiceRolled => _isDiceRolled;

  void rollDice() {
    if (_isDiceRolled) return; // Prevent multiple rolls per turn

    _diceResult = Random().nextInt(6) + 1;
    _isDiceRolled = true;
    
    // In a real game, you would check for valid moves here.
    // If there are no valid moves for the dice result, switch player.
    // For simplicity, we will assume a move is always possible.

    notifyListeners();
  }

  void moveToken(int playerIndex, int tokenIndex) {
    // This is a placeholder for your token movement logic.
    // You would add rules for moving tokens on the board,
    // capturing other players' tokens, and reaching the home area.
    
    print('Player ${players[playerIndex].name} moved token $tokenIndex with a dice roll of $_diceResult');
    
    // Switch to the next player after a move, unless a 6 was rolled.
    if (_diceResult != 6) {
      _switchToNextPlayer();
    } else {
      // If a 6 is rolled, the player gets another turn.
      _isDiceRolled = false;
    }

    notifyListeners();
  }

  void _switchToNextPlayer() {
    _currentPlayerIndex = (_currentPlayerIndex + 1) % _players.length;
    _isDiceRolled = false;
    notifyListeners();
  }
  
  void resetGame() {
    _currentPlayerIndex = 0;
    _diceResult = 1;
    _isDiceRolled = false;
    // Reset player token positions here if you add them
    notifyListeners();
  }
}