import 'package:flutter/material.dart';
import 'package:projetp/widgets/level_button.dart';
import 'package:projetp/utils/line_painter.dart';


class LevelMapPage extends StatefulWidget {
  const LevelMapPage({super.key});

  @override
  _LevelMapPage createState() {
    return _LevelMapPage();
  }
}

class _LevelMapPage extends State<LevelMapPage> {

  final ScrollController _scrollController = ScrollController();
  int currentLevel = 2;

  List<LevelData> levels = List.generate(
    20,
        (index) =>
        LevelData(
          level: (index * 30 + 20),
          icon: Icons.circle,
          unlocked: index == 0,
        ),
  );

  void resetLevels() {
    setState(() {
      currentLevel = 0;
      levels = List.generate(
        20,
      (index) => LevelData(
        level: (index * 30 + 20),
        icon: Icons.circle,
        unlocked: index == 0,
      ),
      );
    });
  }

  Offset calculateLevelPosition(BuildContext context, int level) {
    final path = CurvedLinePainter().createPath(Size(MediaQuery
        .of(context)
        .size
        .width, 2500));
    final metrics = path
        .computeMetrics()
        .first;
    final position = metrics
        .getTangentForOffset(level * metrics.length / 200)
        ?.position ?? Offset.zero;
    return position;
  }

  CustomScrollView _drawLevelsAndLine() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 2500, // Large enough to show the curved line
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: CurvedLinePainter(), // Utilise CurvedLinePainter
                  ),
                ),
                ...levels.map((level) {
                  final position = calculateLevelPosition(
                      context, level.level);
                  print("\x1B[32mposition: $position\x1B[0m");
                  return Positioned(
                    left: position.dx - 60,
                    top: position.dy - 60,
                    child: LevelButton(
                      level: level.level ~/ 20,
                      icon: level.icon,
                      unlocked: level.unlocked,
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _drawFloatingActionButton() {
    return Container(
      width: 100,
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Text('Niveau suivant', style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center),
        onPressed: () {
          if (currentLevel < levels.length) {
            currentLevel++;
            final newLevelData = LevelData(
              level: levels[currentLevel].level,
              icon: levels[currentLevel].icon,
              unlocked: true);
            setState(() {
              levels[currentLevel] = newLevelData;
            });
            final position = calculateLevelPosition(context, currentLevel);
            _scrollController.animateTo(
              (position.dy * 30),
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
            );
            print(position.dy * 30);
          }
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sélection du Niveau'),
      ),
      body: _drawLevelsAndLine(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 100,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: resetLevels,
              child: const Text('Reset', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
            ),
          ),
          const SizedBox(height: 10),
          _drawFloatingActionButton(),
        ],
      ),
    );
  }
}



