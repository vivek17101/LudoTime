class Player {
  final int id;
  final String name;
  final int colorValue;
  
  // Each player has 4 tokens. A position of -1 means it's in the home base.
  final List<int> tokens = [-1, -1, -1, -1];

  Player({
    required this.id,
    required this.name,
    required this.colorValue,
  });
}