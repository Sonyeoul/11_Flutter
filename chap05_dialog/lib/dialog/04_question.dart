

import 'package:flutter/material.dart';

class question extends StatefulWidget {
  const question({super.key});

  @override
  State<question> createState() => _questionState();
}

class _questionState extends State<question> {
  Map<String,String> todolist = {
    "제목": "내용"
  };


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todolist.length,
      itemBuilder: (BuildContext context, int index) {
        String key = todolist.keys.elementAt(index);
        return ListTile(
          title: Text('${index + 1}. ${todolist[key] ?? ""}'),
          trailing: TextButton(
            child: Text('삭제'),
            onPressed: () {
              setState(() {
                todolist.remove(key);
              });
            },
          ),
        );
      },
    );
  }
}
