import 'package:easy_quiz_game/easy_quiz_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getGameWidget(context),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressedStandalone,
        tooltip: 'Launch standalone',
        child: const Icon(Icons.launch),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void onPressedStandalone() {
    Navigator.of(context).push(
      MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => Scaffold(body: getGameWidget(context))),
    );
  }

  static Widget getGameWidget(BuildContext context) {
    return EasyQuizGameApp(
      primaryColor: Theme.of(context).primaryColor,
      menuLogoPath: 'assets/images/logo.png',
      buttonPath: 'assets/images/primary_button.png',
      labelPath: 'assets/images/label.png',
      bgImagePath: 'assets/images/bg.png',
      gradient: const LinearGradient(
        stops: [0, 1],
        begin: Alignment(1, -1),
        end: Alignment(0, 1),
        colors: [Color(0xff300c79), Color(0xff753bc6)],
      ),
      secondaryColor: const Color(0xff753bc6),
    );
  }
}
