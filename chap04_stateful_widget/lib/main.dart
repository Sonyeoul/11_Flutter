import 'package:chap04_stateful_widget/state/01_stateless.dart';
import 'package:chap04_stateful_widget/state/03_Question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('stateful Widget'),
        ),
      ),
      body: Question() ,
    );
  }
}


