import 'package:flutter/material.dart';
import 'package:projetp/pages/level_map_page.dart';
import 'package:projetp/utils/variables.dart';

class SelectAvatar extends StatefulWidget {
  const SelectAvatar({super.key});

  @override
  _SelectAvatar createState() {
    return _SelectAvatar();
  }
}

class _SelectAvatar extends State<SelectAvatar> {
  Widget avatarData(int index) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image(
                    image: AssetImage(avatarsData[index]![3]),
                    fit: BoxFit.cover,
                  ))),
          Text(
            avatarsData[index]![0],
            style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              avatarsData[index]![1],
              style: const TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
              child:
                  SingleChildScrollView(child: Text(avatarsData[index]![2]))),
        ],
      ),
    );
  }

  Widget avatarCart(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LevelMapPage(),
            ));
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: avatarData(index),
          ),
        ),
      ),
    );
  }

// gros bug ici
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select your avatar'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return avatarCart(context, index);
                },
              ),
            );
          } else {
            return PageView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return avatarCart(context, index);
              },
              itemCount: 5,
            );
          }
        },
      ),
    );
  }
}
