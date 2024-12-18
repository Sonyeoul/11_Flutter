
import 'package:chap09_http_dio/models/01_api_model.dart';
import 'package:flutter/material.dart';

class ScrollViewWidget extends StatefulWidget {
  const ScrollViewWidget({super.key});

  @override
  State<ScrollViewWidget> createState() => _ScrollViewWidgetState();
}

class _ScrollViewWidgetState extends State<ScrollViewWidget> {
  final ApiModel apiModel = ApiModel();

  List<dynamic> _posts = [];
  var page = 0;
  var scroll = ScrollController();
  bool _isLoading = false;


  @override
  void initState() {
    super.initState();
    _loadPosts();
    eventListener();
  }

  @override
  void dispose() {
    scroll.removeListener(eventListener);
    scroll.dispose();
    super.dispose();
  } //스크롤 이벤트 리스너 생성
  void eventListener() {
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent &&
          !_isLoading) {
        _loadMorePosts();
      }
    });
  }

  Future<void> _loadPosts() async {
    List<dynamic> posts = await apiModel.fetchGets3(page);
    setState(() {
      _posts.addAll(posts);
    });
  }

  //추가 게시글 목록을 로드하는 함수
  Future<void> _loadMorePosts() async {
    if (_isLoading) return; //로딩중이면 요청하지않음
    setState(() {
      _isLoading = true;
    });
    page++;
    try {
      List<dynamic> morePosts = await apiModel.fetchGets3(page);
      setState(() {
        _posts.addAll(morePosts);
        _isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: _posts.isEmpty
                ? Center(child: Text("로딩중"))
                : ListView.builder(
              controller: scroll,
              itemCount: _posts.length + 1,
              itemBuilder: (context, index) {
                if (index == _posts.length) {
                  return _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox.shrink();
                }
                return ListTile(
                  leading: Text(index.toString()),
                  title: Text(_posts[index]['title']),
                  subtitle: Text(_posts[index]['body']),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}