
import 'package:flutter/material.dart';

class Texttest extends StatefulWidget {
  const Texttest({super.key});

  @override
  State<Texttest> createState() => _TexttestState();
}

class _TexttestState extends State<Texttest> {
  var textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Text(
      "할룽",
      style: textStyle,
    );
  }
}
