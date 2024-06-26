import 'package:flutter/material.dart';
import 'package:projetp/utils/levels.dart';
import 'package:projetp/utils/player.dart';

class LevelButton extends StatelessWidget {
  final int level;
  final IconData icon;
  final bool unlocked;

  const LevelButton(
      {super.key, required this.level, required this.icon, required this.unlocked});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Column(
            children: [
              InkWell(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: unlocked ? Colors.green : Colors.grey,
                  child: Icon(icon, size: 30, color: Colors.white),
                ),
                onTap: () {
                  Levels levels = Levels(levelNumber: level);
                  levels.levelSelection(context, level);
                },
              ),
              const SizedBox(height: 5),
              if (!unlocked) const Icon(Icons.lock, size: 40, color: Colors.black),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Text("Level $level - Juridique"),
            ),
          )
        ],
      ),
    );
  }
}

class LevelData {
  final int level;
  final IconData icon;
  final bool unlocked;

  LevelData({required this.level, required this.icon, required this.unlocked});
}
