import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  final int level;
  final IconData icon;
  final bool unlocked;

  LevelButton({required this.level, required this.icon, required this.unlocked});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.blueAccent,
          child: Icon(icon, size: 30, color: Colors.white),
        ),
        const SizedBox(height: 5),
        if (!unlocked)
          const Icon(
              Icons.lock,
              size: 40,
              color: Colors.black
          ),
      ],
    );
  }
}

class LevelData {
  final int level;
  final IconData icon;
  final bool unlocked;

  LevelData({required this.level, required this.icon, required this.unlocked});
}
