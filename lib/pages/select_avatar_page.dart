import 'package:flutter/material.dart';
import 'package:projetp/pages/level_map_page.dart';
import 'package:projetp/utils/variables.dart';

class SelectAvatar extends StatefulWidget {
  final String playerName;

  const SelectAvatar({
    super.key,
    required this.playerName,
  });

  @override
  _SelectAvatar createState() {
    return _SelectAvatar();
  }
}

class _SelectAvatar extends State<SelectAvatar> {
  final PageController _scrollController = PageController();

  Widget avatarData(int index) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth > 500 ? 500 : constraints.maxWidth;
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: width,
                height: width,
                child: Image(
                  image: AssetImage(avatarsData[index]![3]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
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
              child: SingleChildScrollView(child: Text(avatarsData[index]![2])),
            ),
          ],
        );
      },
    );
  }

  Widget avatarCart(BuildContext context, int index) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.2,
      child: InkWell(
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LevelMapPage(),
              ));
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: MediaQuery.of(context).size.height * 0.1,
            bottom: MediaQuery.of(context).size.height * 0.1,
          ),
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selectionne ton avatar'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1230) {
            print(MediaQuery.of(context).size.width);
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return avatarCart(context, index);
              },
            );
          } else {
            return Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      _scrollController.animateTo(
                        _scrollController.offset -
                            MediaQuery.of(context).size.width,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }),
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return avatarCart(context, index);
                    },
                    itemCount: 5,
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      _scrollController.animateTo(
                        _scrollController.offset +
                            MediaQuery.of(context).size.width,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }),
              ],
            );
          }
        },
      ),
    );
  }

  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
