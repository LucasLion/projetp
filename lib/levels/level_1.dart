import 'package:flutter/material.dart';
import 'package:projetp/widgets/level_button.dart';

class Level1 extends StatelessWidget {
  const Level1({super.key});


  Widget buildLevel1(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          const Text("Juridique"),
          const SizedBox(height: 5),
          const Text("This is level 1"),
          ElevatedButton(
            onPressed: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Level1Question1())
              )
            },
            child: const Text("Commencer le niveau"),
          )
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

class Level1Question1 extends StatelessWidget {
  const Level1Question1({super.key});

  Widget buildLevel1Question1(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Question 1"),
        const SizedBox(height: 5),
        const Text("This is question 1"),
        ElevatedButton(
          onPressed: () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Level1Question1())
            )
          },
          child: const Text("Question suivante"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildLevel1Question1(context),
    );
  }
}