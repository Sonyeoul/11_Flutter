
import 'package:flutter/material.dart';
import 'TextTest.dart';
import 'theme.dart' as style;
void main(){
  runApp(const MyApp());
}
/* 스타일을 넣을때 위젯 하나하나 넣으면 가독성과 유지보수성이 떨어질 수 있는데
* 그래서 한번에 스타일을 줄 수 있는 공간을 제공한다
* */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: style.theme,
      home: MyPage(),
    );
  }
}


class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(children: [Icon(Icons.star),
      Texttest(),],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [IconButton(onPressed: (){}, icon: Icon(Icons.home))]
        ),
      ),
    );
  }
}
