import 'package:flutter/material.dart';
import 'package:projetp/pages/level_selection_screen.dart';

class SelectAvatar extends StatefulWidget {
  const SelectAvatar({super.key});

  @override
  _SelectAvatar createState() {
    return _SelectAvatar();
  }
}

Widget avatarData() {
  return const Column(
    children: [
      Text("First Name: "),
      Text("Last Name: "),
      Text("Bio: "),
    ],
  );

}
Widget avatarCart(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LevelSelectionScreen(),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.person, size: 30, color: Colors.white),
              ),
              avatarData(),

              ]
              ),
          ),
        ),
      ),
    );
}

class _SelectAvatar extends State<SelectAvatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select your avatar'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return avatarCart(context);
        },
        itemCount: 5,
      ),
    );
  }
}