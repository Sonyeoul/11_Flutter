import 'package:flutter/material.dart';

import 'main.dart';

class MovieList extends StatelessWidget {
  final List<Map<String, String>> movieList;
  final Function(Map<String, String>) onDelete;

  const MovieList({Key? key, required this.movieList, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('영화 목록'),
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return ListTile(
            title: Text(movie['제목'] ?? ''),
            subtitle: Text(movie['감독'] ?? ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetail(movie: movie),
                ),
              );
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => onDelete(movie),
            ),
          );
        },
      ),
    );
  }
}

class MovieDetail extends StatelessWidget {
  final Map<String, String> movie;

  const MovieDetail({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['제목'] ?? '영화 상세'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              movie['제목'] ?? '',
            ),
            Text(
              '감독: ${movie['감독'] ?? ''}',
            ),
            Text(
              movie['설명'] ?? ''
            ),
          ],
        ),
      ),
    );
  }
}

class MovieAdd extends StatefulWidget {
  final List<Map<String, String>> movieList;
  final Function(Map<String, String>) addMovie; // 영화 추가 메소드
  final Function() onMovieAdded;


  const MovieAdd({
    Key? key,
    required this.movieList,
    required this.addMovie,
    required this.onMovieAdded,
  }) : super(key: key);
  @override
  _MovieAddState createState() => _MovieAddState();
}

class _MovieAddState extends State<MovieAdd> {
  final _titleController = TextEditingController();
  final _directorController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('영화 추가'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: '제목'),
            ),
            TextField(
              controller: _directorController,
              decoration: InputDecoration(labelText: '감독'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: '설명'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _directorController.text.isNotEmpty &&
                    _descriptionController.text.isNotEmpty) {
                  final newMovie = {
                    '제목': _titleController.text,
                    '감독': _directorController.text,
                    '설명': _descriptionController.text,
                  };
                  widget.addMovie(newMovie); // 영화 목록에 추가하고 MovieList로 이동

                  // 입력 필드 초기화
                  _titleController.clear();
                  _directorController.clear();
                  _descriptionController.clear();
                  widget.onMovieAdded();
                }
              },
              child: Text('영화 추가'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _directorController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}


// Navigator.pushReplacement(
// context,
// MaterialPageRoute(
// builder: (context) => MovieList(movieList: widget.movieList),
// ),




class MovieSearch extends StatefulWidget {
  final List<Map<String, String>> movieList;

  const MovieSearch({Key? key, required this.movieList}) : super(key: key);

  @override
  _MovieSearchState createState() => _MovieSearchState();
}

class _MovieSearchState extends State<MovieSearch> {
  String _searchQuery = '';
  List<Map<String, String>> _searchResults = [];

  void _performSearch(String query) {
    setState(() {
      _searchQuery = query;
      _searchResults = widget.movieList.where((movie) =>
      movie['제목']!.toLowerCase().contains(query.toLowerCase()) ||
          movie['감독']!.toLowerCase().contains(query.toLowerCase())
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            onChanged: _performSearch,
            decoration: InputDecoration(
              labelText: '영화 제목 ',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _searchQuery.isEmpty ? widget.movieList.length : _searchResults.length,
            itemBuilder: (context, index) {
              final movie = _searchQuery.isEmpty ? widget.movieList[index] : _searchResults[index];
              return ListTile(
                title: Text(movie['제목'] ?? ''),
                subtitle: Text(movie['감독'] ?? ''),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MovieDetail(movie: movie)),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}


