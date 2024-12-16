import 'package:flutter/material.dart';

/*
* ListView
* -flutter 에서 스크롤이 가능한 리스트를 생성하는 위젯
* - 여러개의 아이템을 세로 도는 가로 방향으로 정렬해 나열할 때 사용되며
* 화면에 표시할 수 있는 아이템이 많아질 경우
* 스크롤 기능을 자동으로 제공한다.
* 데이터 목록을 자동으로 제공한다
* - 데이터 목록을 표시하는 앱에서 자주 사용된다.*/
class ListApp extends StatelessWidget {
  const ListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[
          Text('Item 1'),
          Text('Item 2'),
          Text('Item 3'),
          Text('Item 4'),
          Text('Item 5'),
          Text('Item 6'),
        ],
      ),
    );
  }
}
