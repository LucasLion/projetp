import 'package:flutter/material.dart';
import 'package:projetp/pages/level_map_page.dart';
import 'package:projetp/utils/variables.dart';
import 'package:projetp/widgets/level_menu_button.dart';

class Level1 extends StatelessWidget {
  const Level1({super.key});

  Widget buildLevel1(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(BorderSide(
                    color: Colors.black,
                    width: 2,
                  )),
                ),
              ),
              const Positioned(
                bottom: 0,
                right: 0,
                child: Icon(
                  Icons.lock_open,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              const Positioned(
                bottom: 33,
                right: 33,
                child: Icon(
                  Icons.balance,
                  color: Colors.black,
                  size: 30,
                ),
              )
            ],
          ),
          const Text("Juridique"),
          const SizedBox(height: 15),
          Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              width: MediaQuery.of(context).size.width / 1.5,
              child: const Text(
                  "Sois prêt à répondre à des questions sur le droit des femmes.",
                  textAlign: TextAlign.center)),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            onPressed: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Level1QuestionGenerator(
                      question: juridicQuiz[0]![0],
                      answer: juridicQuiz[0]![1],
                      level: 0),
                ),
              ),
            },
            child: const Text("Commencer le niveau"),
          ),
          const LevelMenuButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildLevel1(context),
    );
  }
}

class Level1QuestionGenerator extends StatefulWidget {
  final String question;
  final String answer;
  int level;

  Level1QuestionGenerator({
    super.key,
    required this.question,
    required this.answer,
    required this.level,
  });

  @override
  _Level1QuestionGeneratorState createState() =>
      _Level1QuestionGeneratorState();
}

class _Level1QuestionGeneratorState extends State<Level1QuestionGenerator> {
  Color trueColor = Colors.transparent; // Couleur par défaut
  Color falseColor = Colors.transparent;
  bool _isAnswered = false;

  Widget buildLevel1Questions(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Question ${widget.level + 1}"),
        const SizedBox(height: 5),
        Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(10),
            ),
            width: MediaQuery.of(context).size.width / 1.5,
            child: Text(widget.question)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (trueColor == Colors.transparent) {
                      trueColor = Colors.green;
                      falseColor = Colors.transparent;
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: trueColor,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 30, right: 30),
                  child: const Text("Vrai"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (falseColor == Colors.transparent) {
                      falseColor = Colors.green;
                      trueColor = Colors.transparent;
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: falseColor,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 30, right: 30),
                  child: const Text("Faux"),
                ),
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: _isAnswered
              ? null
              : () {
                  _isAnswered = true;
                  if (trueColor == Colors.green && widget.answer == "Vrai") {
                    print("Truecolor: $trueColor, Answer: ${widget.answer}");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Bonne réponse!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else if (falseColor == Colors.green &&
                      widget.answer == "Faux") {
                    print("Falsecolor: $falseColor, Answer: ${widget.answer}");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Bonne réponse!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else {
                    print(
                        "Falsecolor: $falseColor, Truecolor: $trueColor, Answer: ${widget.answer}");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Mauvaise réponse!"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: const Text("Valider"),
        ),
        ElevatedButton(
          onPressed: () => {
            ScaffoldMessenger.of(context).hideCurrentSnackBar(),
            if (widget.level < 4)
              {
                widget.level++,
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Level1QuestionGenerator(
                            question: juridicQuiz[widget.level]![0],
                            answer: juridicQuiz[widget.level]![1],
                            level: widget.level)))
              }
            else
              {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LevelMapPage()))
              }
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child:
              Text(widget.level < 4 ? "Question suivante" : "Retour au menu"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildLevel1Questions(context),
    );
  }
}
