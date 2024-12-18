import 'package:chap10_spring_to_flutter/models/model.dart';
import 'package:flutter/material.dart';

class insertMenu extends StatefulWidget {
  const insertMenu({super.key});

  @override
  State<insertMenu> createState() => _insertMenuState();
}

class _insertMenuState extends State<insertMenu> {
  final MenuModel _menuModel = MenuModel();

  TextEditingController _menuNameController = TextEditingController();
  TextEditingController _menuPriceController = TextEditingController();
  TextEditingController _categoryCodeController = TextEditingController();
  TextEditingController _orderableStatusController = TextEditingController();

  void _registMenu() async {
    Map<String, dynamic> menuData = {
      'menuName' : _menuNameController.text,
      'menuPrice' : int.parse(_menuPriceController.text),
      'categoryCode' : int.parse(_categoryCodeController.text),
      'orderableStatus' : _orderableStatusController.text
    };
    try {
      String result = await _menuModel.insertMenu(menuData);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result))
      );
      if (result == '성공') {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("오류 발생: ${e.toString()}"))
      );
      print(e);
    }
  }  // _registMenu 메서드의 닫는 중괄호 추가

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메뉴 등록'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _menuNameController, decoration: InputDecoration(labelText: '메뉴이름')),
            TextField(controller: _menuPriceController, decoration: InputDecoration(labelText: '메뉴가격')),
            TextField(controller: _categoryCodeController, decoration: InputDecoration(labelText: '카테고리 코드')),
            TextField(controller: _orderableStatusController, decoration: InputDecoration(labelText: '주문가능여부')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registMenu,
              child: Text('메뉴 등록'),
            )
          ],
        ),
      ),
    );
  }
}