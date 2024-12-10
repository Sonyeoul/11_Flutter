import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Center(
        child: Text("layout"),
      ),
    ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Text("Container 1"),
          )
        ],
      )
    );
  }
}
