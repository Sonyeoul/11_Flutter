import 'package:chap02_layout_style/style/Mybutton_style.dart';
import 'package:chap02_layout_style/style/Question_style.dart';
import 'package:chap02_layout_style/style/bar_style.dart';
import 'package:chap02_layout_style/style/container-style.dart';
import 'package:chap02_layout_style/style/text_style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
    MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
        //MyText()
        //MyContainer()
      //MyButton()
      //MyBar()
      MyQuestion()
    );
  }
}