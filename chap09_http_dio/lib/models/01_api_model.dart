import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiModel {
  //Get 요청 보내서 게시글 목록 가져오기

  Future<List<dynamic>> fetchGets() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('get요청실패');
    }
  }
  // Future<List<dynamic>> fetchGets2() async {
  //   final dio = Dio();
  //   try {
  //     final response = await dio.get(
  //         'https://jsonplaceholder.typicode.com/posts');
  //     if (response.statusCode == 200) {
  //       return response.data as List<dynamic>;
  //     }
  //   } catch (e) {
  //     throw Exception('get요청실패');
  //   }
  //   final formData = FormData.fromMap({
  //     //"file": await MultipartFile.fromFile(filePath, filename: "예시이미지.jpg"),
  //     "decription": "심플데이타"
  //   });
  //   final response = await dio.post(
  //       'https://example.com/upload', data: formData);
  // }
  Future<List<dynamic>> fetchGets3(int page) async {
    final dio = Dio();
    print(page);
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/posts' // 페이지네이션 추가
      );
      if (response.statusCode == 200) {
        return response.data as List<dynamic>;
      } else {
        throw Exception('Failed to load posts. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching posts: $e');
      throw Exception('get요청실패');
    }
  }
}