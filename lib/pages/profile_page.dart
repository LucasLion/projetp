
import 'package:flutter/material.dart';
import 'package:projetp/pages/level_map_page.dart';
import 'package:projetp/utils/player.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() {
    return _ProfilePageState();
  }

}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(Provider.of<Player>(context, listen: false).playerAvatar),
            ),
            const SizedBox(height: 20),
            Text(Provider.of<Player>(context, listen: false).playerName),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LevelMapPage()));
              },
              child: const Text('Selectionner niveau'),
            ),
          ],
        ),
      ),
    );
  }
}