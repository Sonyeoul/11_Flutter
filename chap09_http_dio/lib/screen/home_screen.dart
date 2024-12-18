

import 'package:flutter/material.dart';

import '../widgets/01_api_view_weidget.dart';
import '../widgets/02_scroll_view_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Center(child: Text("메인 페이지", style: TextStyle(fontSize: 20),),),ApiView(),ScrollViewWidget(),
    Center(child: Text("게시글보기", style: TextStyle(fontSize: 20),),),
    Center(child: Text("무한 스크롤", style: TextStyle(fontSize: 20),),),
    Center(child: Text("POST 연습", style: TextStyle(fontSize: 20),),),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API요청"),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'list'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'list_alt'),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Post'),
        ]
      ),
    );
  }
}
