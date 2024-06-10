import 'package:flutter/material.dart';

class Player extends ChangeNotifier {
  String playerName;
  String playerAvatar;
  int playerScore;

  Player({
    required this.playerName,
    required this.playerAvatar,
    required this.playerScore,
  });

  void setPlayerName(String name) {
    playerName = name;
    notifyListeners();
  }

  void incrementScore() {
    playerScore++;
    notifyListeners();
  }

  void setAvatar(String avatar) {
    playerAvatar = avatar;
    notifyListeners();
  }

  void getAvatar() {
    playerAvatar;
  } 
}
