
/*
* bottomNavigationBar
* - 하단 네비게이션 바를 구현하는데 사용된다
*  유저가 탭을 클릭하면 onTap 이 실행되고 선택된 인덱스가 변경된다
* 선택된 인덱스에 따라서 다른 위젯을 표시할 수 있다
* 주요 속성
* cyrrentIndex - 현재 선택된 탭의 인덱스
* onTap
* items
* */
import 'package:flutter/material.dart';
import 'question.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyMovie(),
    );
  }
}
class MyMovie extends StatefulWidget {
  const MyMovie({super.key});

  @override
  State<MyMovie> createState() => _MyMovieState();
}

class _MyMovieState extends State<MyMovie> {
  int _selectedIndex = 0;
  List<Map<String, String>> _movieList = []; // 영화 목록을 상태로 관리

  void _addMovie(Map<String, String> movie) {
    setState(() {
      _movieList.add(movie); // 영화 추가
    });
  }

  void _deleteMovie(Map<String, String> movie) {
    setState(() {
      _movieList.remove(movie); // 영화 삭제
    });
  }

  Widget _getPage() {
    switch (_selectedIndex) {
      case 0:
        return MovieList(movieList: _movieList, onDelete: _deleteMovie);
      case 1:
        return MovieAdd(
          movieList: _movieList,
          addMovie: _addMovie,
          onMovieAdded: () => setState(() => _selectedIndex = 0),
        );
      case 2:
        return MovieSearch(movieList: _movieList);
      default:
        return Center(child: Text('선택없음'));
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('영화'),
      ),
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: '영화 목록'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '영화 추가'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '영화 검색'),
        ],
      ),
    );
  }
}