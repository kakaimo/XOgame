import 'package:flutter/material.dart';
import 'package:xogame/playername.dart';
import 'package:xogame/xoscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PlayerName.routeName,
      routes: {
        Xoscreen.routeName: (context) => Xoscreen(),
        PlayerName.routeName: (context) => PlayerName(),
      },
    );
  }
}
