
import 'package:chap10_spring_to_flutter/home/mainScreen.dart';
import 'package:chap10_spring_to_flutter/widget/deleteWidget.dart';
import 'package:chap10_spring_to_flutter/widget/insertWidget.dart';
import 'package:chap10_spring_to_flutter/widget/seachWidget.dart';
import 'package:chap10_spring_to_flutter/widget/updateWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // 탭에 따라 표실할 화면들
  final List<Widget> _pages = [
    MainScreen(),
    searchMenu(),
    insertMenu(),
    MenuUpdate(),
    deleteMenu(),
    //Center(child: Text('메인 화면',style: TextStyle(fontSize: 30))),
    //Center(child: Text('조회 화면',style: TextStyle(fontSize: 30))),
    //Center(child: Text('등록 화면',style: TextStyle(fontSize: 30))),
    //Center(child: Text('수정 화면',style: TextStyle(fontSize: 30))),
   // Center(child: Text('삭제 화면',style: TextStyle(fontSize: 30))),
  ];
  //탭 선택시 호출함수
  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Restaurant'),
        backgroundColor: Colors.black,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: onTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '조회'),
          BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: '등록'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: '수정'),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: '삭제'),
      ]),
    );
  }
}
