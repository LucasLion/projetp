import 'package:flutter/material.dart';
import 'package:projetp/levels/level_1.dart';

class Levels {
  final int levelNumber;

  Levels({required this.levelNumber});

  levelSelection(BuildContext context, int levelNumber) {
    switch (levelNumber) {
      case 1:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Level1()));
        break;
      case 2:
        break;
    }
  }
}
