import 'package:flutter/material.dart';
import 'package:projetp/pages/level_map_page.dart';

class LevelMenuButton extends StatelessWidget {
  const LevelMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LevelMapPage()));
      },
      child: const Text("Retour au menu"),
    );
  }
}
