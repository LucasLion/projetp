import 'package:flutter/material.dart';
import 'package:projetp/pages/level_selection_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pseudo',
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LevelSelectionScreen(),
                  ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // This is the border radius
              ),
              padding: EdgeInsets.all(10), // This is the padding
              minimumSize: Size(150, 50), // This is the minimum size
            ),
            child: const Text(
              'Connexion',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}