import 'package:flutter/material.dart';

class DialogTest4 extends StatelessWidget {
  const DialogTest4({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text("버튼", style: TextStyle(fontSize: 30)),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("텍스트 입력"),
                content: TextField(
                  decoration: InputDecoration(
                    hintText: "입력하세요",
                    labelText: "입력"
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text("취소"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text("확인"),
                    onPressed: () {
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