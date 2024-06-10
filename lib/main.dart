import 'package:flutter/material.dart';
import 'package:projetp/pages/login_page.dart';
import 'package:projetp/utils/player.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //FlutterNativeSplash.remove();
  runApp(
    ChangeNotifierProvider(
      create: (context) => Player(playerName: '', playerAvatar: '', playerScore: 0),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        fontFamily: 'OpenDyslexic3',
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}


// whenever your initialization is completed, remove the splash screen: