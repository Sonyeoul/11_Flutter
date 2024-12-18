
import 'package:chap10_spring_to_flutter/models/model.dart';
import 'package:flutter/material.dart';

class deleteMenu extends StatefulWidget {
  const deleteMenu({super.key});

  @override
  State<deleteMenu> createState() => _deleteMenuState();
}

class _deleteMenuState extends State<deleteMenu> {

  final MenuModel _menuModel = MenuModel();
  List<dynamic> _menus = [];
  dynamic _selectedMenu;

  @override
  void initState() {
    super.initState();
    _loadMenus();
  }

  void _loadMenus() async {
    List<dynamic> menuData = await _menuModel.searchMenu();
    setState(() {
      _menus = menuData;
    });
  }
  void _onMenuSelected(dynamic menu){
    setState(() {
      _selectedMenu = menu;
    });
  }
  //수정 메뉴 등록 메서드

  void _registMenu() async {
    try {
      String result = await _menuModel.deleteMenu(_selectedMenu['menuCode']);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메뉴 삭제'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<dynamic>(
              value: _selectedMenu,
              hint: Text('메뉴 선택'),
              onChanged: (dynamic newValue) {
                _onMenuSelected(newValue);
              },
              items: _menus.map((dynamic menu) =>
                  DropdownMenuItem(
                    value: menu,
                    child: Text(menu['menuName']),
                  )
              ).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _registMenu,
                child: Text("선택한 메뉴 삭제하기")
            ),
          ],
        ),
      ),
    );
  }
}