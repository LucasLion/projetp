import 'package:level_map/level_map.dart';
import 'package:flutter/material.dart';
import 'package:projetp/utils/variables.dart';
import 'dart:async';

class LevelMapPage extends StatefulWidget {
  const LevelMapPage({super.key});

  @override
  LevelMapPageState createState() {
    return LevelMapPageState();
  }
}

class LevelMapPageState extends State<LevelMapPage> {
  double imageWidth = 100;
  double imageHeight = 100;

  final StreamController<double> _currentLevelController =
      StreamController<double>.broadcast();

  double _currentLevel = 1.0;

  @override
  void initState() {
    super.initState();
    _currentLevelController.add(_currentLevel);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      StreamBuilder<double>(
          stream: _currentLevelController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _currentLevel = snapshot.data!;
            }
            return LevelMap(
              backgroundColor: Colors.limeAccent,
              levelMapParams: LevelMapParams(
                pathStrokeWidth: 9,
                pathColor: Colors.blue,
                levelHeight: 300,
                levelCount: 12,
                currentLevel: _currentLevel,
                enableVariationBetweenCurves: true,
                maxVariationFactor: 0.8,
                dashLengthFactor: 0.05,
                shadowDistanceFromPathOffset: const Offset(10, 5),
                currentLevelImage: ImageParams(
                  path: currentLevelIcon,
                  size: Size(imageWidth, imageHeight),
                ),
                lockedLevelImage: ImageParams(
                  path: lockedLevelIcon,
                  size: Size(imageWidth, imageHeight),
                ),
                completedLevelImage: ImageParams(
                  path: completedLevelIcon,
                  size: Size(imageWidth, imageHeight),
                ),
              ),
            );;
          }),
      Container(
        padding: const EdgeInsets.all(80),
        child: ElevatedButton(
          onPressed: () {
            print("current level: $_currentLevel");
            _currentLevelController.add(_currentLevel + 1);
          },
          child: const Text('Next Level'),
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    _currentLevelController.close();
  }
}
