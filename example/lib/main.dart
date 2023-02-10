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
      body: const Center(
        child: EasyQuizGameApp(
          primaryColor: Color(0xff300c79),
          menuLogoPath: 'assets/images/logo.png',
          buttonPath: 'assets/images/primary_button.png',
          labelPath: 'assets/images/label.png',
          bgImagePath: 'assets/images/bg.png',
          gradient: LinearGradient(
            stops: [0, 1],
            begin: Alignment(1, -1),
            end: Alignment(0, 1),
            colors: [Color(0xff300c79), Color(0xff753bc6)],
          ),
          secondaryColor: Color(0xff753bc6),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
