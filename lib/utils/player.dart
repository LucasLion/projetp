import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  final String playerName;
  final String playerAvatar;
  final int playerScore;

  const Player({
    super.key,
    required this.playerName,
    required this.playerAvatar,
    required this.playerScore,
    });

  @override
  _Player createState() {
    return _Player();
  }
}

class _Player extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}