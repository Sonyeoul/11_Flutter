
import 'package:chap10_spring_to_flutter/models/model.dart';
import 'package:flutter/material.dart';

class searchMenu extends StatefulWidget {
  const searchMenu({super.key});

  @override
  State<searchMenu> createState() => _searchMenuState();
}

class _searchMenuState extends State<searchMenu> {
  final MenuModel _menuModel = MenuModel();
  List<dynamic> _menus = [];

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _menus.length,
      itemBuilder: (context, index) {
        final menu = _menus[index];
        return ListTile(
          title: Text(menu['menuName'] ?? '메뉴없음'),
          subtitle: Text('Price: ${menu['menuPrice'] ?? '가격없음'}'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPage(menu: menu),
              ),
            );
          },
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> menu;

  const DetailPage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu['menuName'] ?? '메뉴 상세 정보'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('메뉴 이름: ${menu['menuName'] ?? '정보 없음'}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('가격: ${menu['menuPrice'] ?? '정보 없음'}원', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('카테고리: ${menu['categoryCode'] ?? '정보 없음'}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('주문 가능 여부: ${menu['orderableStatus'] ?? '정보 없음'}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

