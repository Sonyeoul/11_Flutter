import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  Map<String, Map<String, dynamic>> todolist = {
    "제목": {"content": "내용", "index": 1}
  };
  int lastIndex = 1;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (BuildContext context, int index) {
          String key = todolist.keys.elementAt(index);
          int itemIndex = todolist[key]!['index'];
          return ListTile(
            title: Text('$itemIndex. $key'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(key),
                    content: Text(todolist[key]!['content'] ?? ''),
                    actions: [
                      TextButton(
                        child: Text('확인'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
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
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('등록'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('일정 등록'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(hintText: "제목"),
                    ),
                    TextField(
                      controller: contentController,
                      decoration: InputDecoration(hintText: "내용"),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    child: Text('취소'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('추가'),
                    onPressed: () {
                      setState(() {
                        if (titleController.text.isNotEmpty) {
                          lastIndex++;
                          todolist[titleController.text] = {
                            'content': contentController.text,
                            'index': lastIndex
                          };
                        }
                      });
                      titleController.clear();
                      contentController.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}