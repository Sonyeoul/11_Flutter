

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* ListTile
* flutter 에서 리스트 아이템을 간편하게 구성할 수 있는 위젯
* 텍스트 아이콘 이미지 등을 간단하게 배치할 수 있어 설정 화면
* 채팅목록 연락처 목록 등의 리스트에서 자주 사용된다.*/
class ListApp2 extends StatelessWidget {
  const ListApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('ListTile Example'),
        ),
      ),
      body: ListView(
        children: [ListTile(
          leading: Image.asset('asset/zzz.jpg'),
          title: Text('국힘 내힘!'),
          trailing: Icon(Icons.message),
          onTap: () {}
        ),
        Padding(padding: EdgeInsets.only(top:10)),
        ListTile(
          leading: Image.asset('asset/zzz.jpg'),
          title: Text('국��� 내���!'),
          trailing: Icon(Icons.message),
          onTap: () {}
        )],
      )
    );
  }
}
