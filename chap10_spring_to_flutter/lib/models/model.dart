
import 'package:dio/dio.dart';

class MenuModel{
  //메뉴 조회
  Future<List<dynamic>> searchMenu() async {
    final dio = Dio();
    try{
      final response = await dio.get('http://localhost:8080/menus/select');
      if(response.statusCode == 200){
        return response.data as List<dynamic>;
      } else {
        throw Exception("실패");
      }
    }catch(e){
      throw Exception('비상 $e');
    }  
  }
  
  
  
  //메뉴수정
  Future<String> updateMenu(int menuCode,Map<String,dynamic> menuData) async{
    final dio = Dio();
    try{
      //int intMenuCode = int.parse(menuCode);
      final response = await dio.put('http://localhost:8080/menus/update/$menuCode', data: menuData);
      
      if(response.statusCode == 200){
        return '성공';
      }else {
        return "실패";
      }
    }catch(e){
      throw Exception('Failed to update menu: $e');
    }  
  }
  //메뉴 등록
  Future<String> insertMenu(Map<String,dynamic> menuData) async{
    final dio = Dio();
    try{
      final response = await dio.post('http://localhost:8080/menus/insert', data: menuData);
      if(response.statusCode == 200){
        return '성공';
      } else {
        return "실패";
      }
    }catch(e){
      throw Exception('Failed to insert menu: $e');
    }  
  }

  Future<String> deleteMenu(int menuCode) async{
    final dio = Dio();
    try{
      final response = await dio.delete('http://localhost:8080/menus/delete/$menuCode');
      if(response.statusCode == 200){
        return '성공';
      } else {
        return "실패";
      }
    }catch(e){
      throw Exception('Failed to insert menu: $e');
    }
  }
 }
