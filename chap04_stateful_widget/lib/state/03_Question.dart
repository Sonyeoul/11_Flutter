import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  Map<String, int> menu = {
    '사과': 0,
    '바나나': 0,
    '귤': 0,
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menu.length,
      itemBuilder: (BuildContext context, int index) {
        String key = menu.keys.elementAt(index);
        return ListTile(
          title: Text('${menu[key]} $key'),
          trailing: TextButton(
            child: Text("좋아용"),
            onPressed: () {
              setState(() {
                menu[key] = menu[key]! + 1;
              });
            },
          ),
        );
      },
    );
  }
}