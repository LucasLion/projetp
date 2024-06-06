import 'package:flutter/material.dart';
import 'package:projetp/pages/level_map_page.dart';
import 'package:projetp/pages/login_page.dart';

void main() {
  runApp(const MyApp());
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

