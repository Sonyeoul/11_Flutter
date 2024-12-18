import 'package:chap10_spring_to_flutter/models/model.dart';
import 'package:flutter/material.dart';


class MenuUpdate extends StatefulWidget {
  const MenuUpdate({super.key});

  @override
  State<MenuUpdate> createState() => _MenuUpdateState();
}

class _MenuUpdateState extends State<MenuUpdate> {
 TextEditingController _menuNameController = TextEditingController();
 TextEditingController _orderableController = TextEditingController();
 TextEditingController _priceController = TextEditingController();
 TextEditingController _categoryCodeController = TextEditingController();

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
     _menuNameController.text = menu['menuName'];
     _priceController.text = menu['menuPrice'].toString();
     _categoryCodeController.text = menu['categoryCode'].toString();
     _orderableController.text = menu['orderableStatus'];
   });
 }
 //수정 메뉴 등록 메서드

 void _registMenu() async {
   Map<String, dynamic> menuData = {
     'menuCode' : _selectedMenu['menuCode'],
     'menuName' : _menuNameController.text,
     'menuPrice' : int.parse(_priceController.text),
     'categoryCode' : int.parse(_categoryCodeController.text),
     'orderableStatus' : _orderableController.text
   };
   try {
     String result = await _menuModel.updateMenu(_selectedMenu['menuCode'], menuData);
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
    return Padding(padding: EdgeInsets.all(16), child: Column(
        children: [
          DropdownButton(
            value: _selectedMenu,
            hint: Text('메뉴 선택'),
            onChanged: (dynamic newValue) {
              _onMenuSelected(newValue);
            },
            items: _menus.map((dynamic menu) =>
                DropdownMenuItem(
                  value: menu,
                  child: Text(menu['menuName']),
                )).toList(),
          ),
          TextField(
            controller: _menuNameController,
            decoration: InputDecoration(labelText: '메뉴 이름'),
          ),
          TextField(
            controller: _priceController,
            decoration: InputDecoration(labelText: '가격'),
          ),
          TextField(
            controller: _categoryCodeController,
            decoration: InputDecoration(labelText: '카테고리코드'),
          ),
          TextField(
            controller: _orderableController,
            decoration: InputDecoration(labelText: '주문가능여부'),
          ),
          ElevatedButton(onPressed: _registMenu, child: Text("메뉴 수정"))
        ]),
    );
  }
}
