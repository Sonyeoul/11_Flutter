
import 'package:chap09_http_dio/models/01_api_model.dart';
import 'package:flutter/material.dart';

class ApiView extends StatefulWidget {
  const ApiView({super.key});

  @override
  State<ApiView> createState() => _ApiViewState();
}

class _ApiViewState extends State<ApiView> {
  final ApiModel apiModel = ApiModel();
  List<dynamic> _posts = [];


  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    try{
      List<dynamic> posts = await apiModel.fetchGets();
      setState(() => _posts = posts);
    }catch(e){
      print("비상비상");
      _showErrorDialog();
    }
  }//오류 보여주는 함수
  void _showErrorDialog() {
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("오류"),
        content: Text("게시글 불러오는데 실패함"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("확인")
          )
        ]
      );
    });
  }
  void _deletePost(int postId){
    setState(() {
      _posts.removeWhere((post) => post['id'] == postId);
      //(post){return post['id']== postId;}
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),child: Column(
      children: [
        Expanded(
          child: _posts.isEmpty ? CircularProgressIndicator() : ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_posts[index]['title']),
                subtitle: Text(_posts[index]['body']),
                trailing: IconButton(
                  onPressed: () => _deletePost(_posts[index]['id']),
                  icon: Icon(Icons.delete),
                ),
              );
            },
          ),
        )
      ],
    ));
  }
}
