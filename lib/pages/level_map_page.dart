import 'package:flutter/material.dart';
import 'package:projetp/pages/profile_page.dart';
import 'package:projetp/utils/player.dart';
import 'package:projetp/widgets/level_button.dart';
import 'package:projetp/utils/line_painter.dart';
import 'package:provider/provider.dart';

class LevelMapPage extends StatefulWidget {
  const LevelMapPage({super.key});

  @override
  _LevelMapPage createState() {
    return _LevelMapPage();
  }
}

class _LevelMapPage extends State<LevelMapPage> {
  final ScrollController _scrollController = ScrollController();
  int currentLevel = 0;

  List<LevelData> levels = List.generate(
    20,
    (index) => LevelData(
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
    final path = CurvedLinePainter()
        .createPath(Size(MediaQuery.of(context).size.width, 2500));
    final metrics = path.computeMetrics().first;
    final offset = level * metrics.length / 200 + 30 / 2500 * metrics.length;
    final position =
        metrics.getTangentForOffset(offset)?.position ?? Offset.zero;
    return position;
  }

  CustomScrollView _drawLevelsAndLine() {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/doodle.png'),
                fit: BoxFit.cover,
              ),
            ),
            height: 2500, // Large enough to show the curved line
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: CurvedLinePainter(), // Utilise CurvedLinePainter
                  ),
                ),
                ...levels.map((level) {
                  final position = calculateLevelPosition(context, level.level);
                  return Positioned(
                    left: position.dx - 60,
                    top: position.dy - 60,
                    child: LevelButton(
                      level: level.level ~/ 20,
                      icon: level.icon,
                      unlocked: level.unlocked,
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _drawFloatingActionButton() {
    return SizedBox(
      width: 100,
      child: FloatingActionButton(
          heroTag: 'nextLevel',
          backgroundColor: Colors.blue,
          child: const Text('Niveau suivant',
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          onPressed: () {
            print(
                "currentLevel: $currentLevel | levels.length: ${levels.length}");
            if (currentLevel < levels.length) {
              currentLevel++;
              print(
                  "currentLevel: $currentLevel | levels.length: ${levels.length}");
              final newLevelData = LevelData(
                  level: levels[currentLevel].level,
                  icon: levels[currentLevel].icon,
                  unlocked: true);
              setState(() {
                levels[currentLevel] = newLevelData;
              });
              final position = calculateLevelPosition(context, currentLevel);
              print("position: $position");
              _scrollController.animateTo(
                (position.dy * 30),
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeInOut,
              );
            }
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Stack(children: [
            _drawLevelsAndLine(),
            Positioned(
              top: 10.0,
              left: 10.0,
              child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                        Provider.of<Player>(context, listen: false)
                            .playerAvatar),
                  )),
            ),
            Positioned(
              top: 10,
              left: 70,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        title: Text('Info'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(
                                  'Le harcèlement est un comportement répétitif qui vise à dégrader la qualité de vie d\'une personne.'),
                              Text(
                                  'Il est important de parler du harcèlement si vous en êtes victime ou si vous en êtes témoin.'),
                              Text(
                                  'La prévention du harcèlement passe par l\'éducation et la sensibilisation.'),
                              Text(
                                  'N\'hésitez pas à demander de l\'aide si vous êtes victime de harcèlement.'),
                              Text(
                                  'Ensemble, nous pouvons mettre fin au harcèlement.'),
                              Text('Numéro d\'aide national : 123-456-7890'),
                              Text('Numéro d\'aide local : 098-765-4321'),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 184, 62, 196),
                        width: 2),
                    borderRadius: BorderRadius.circular(2),
                    color: const Color.fromARGB(170, 184, 62, 196),
                  ),
                  child: const Icon(
                    Icons.question_mark,
                    color: Color.fromARGB(255, 111, 61, 116),
                    size: 30,
                  ),
                ),
              ),
            ),
          ]),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 100,
                child: FloatingActionButton(
                  heroTag: 'reset',
                  backgroundColor: Colors.red,
                  onPressed: resetLevels,
                  child: const Text('Reset',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center),
                ),
              ),
              const SizedBox(height: 10),
              _drawFloatingActionButton(),
            ],
          ),
        ),
      ),
    );
  }
}
