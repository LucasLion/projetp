import 'package:level_map/level_map.dart';
import 'package:flutter/material.dart';
import 'package:projetp/utils/variables.dart';

class LevelMapPage extends StatelessWidget {
  double imageWidth = 100;
  double imageHeight = 100;

  @override
  Widget build(BuildContext context) {
    return LevelMap(
      backgroundColor: Colors.limeAccent,
      levelMapParams: LevelMapParams(
        pathStrokeWidth: 9,
        pathColor: Colors.blue,
        levelHeight: 300,
        levelCount: 12,
        currentLevel: 2,
        enableVariationBetweenCurves: true,
        maxVariationFactor: 0.8,
        dashLengthFactor: 0.05,
        shadowDistanceFromPathOffset: const Offset(10, 5),
        currentLevelImage: ImageParams(
          path:
            currentLevelIcon,
          size: Size(imageWidth, imageHeight),
        ),
        lockedLevelImage: ImageParams(
          path:
            lockedLevelIcon,
          size: Size(imageWidth, imageHeight),
        ),
        completedLevelImage: ImageParams(
          path:
            completedLevelIcon,
          size: Size(imageWidth, imageHeight),
        ),
        startLevelImage: ImageParams(
          path:
            homeIcon,
          size: Size(imageWidth, imageHeight),
        ),
        pathEndImage: ImageParams(
          path:
            endIcon,
          size: Size(imageWidth, imageHeight),
        ),
      ),
    );
  }
}
