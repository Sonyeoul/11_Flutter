
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("layout"),
        ),
      ),
      body: Center(
        child: Text("텍스트스타일",
        style: TextStyle(color: Colors.limeAccent),
          /*
          * color
          * Colors.red 정해진 색상표에서 고르는법
          * Color.fromRGBO rgbo로 고르는 방법
          * Color(0xfffff) 16진수값으로 고르는 법
          * backgroundColor
          * fontSize
          * fontWeight
          * fontFamilly
          * */
        ),
      ),
    );
  }
}
