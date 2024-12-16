
import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
   NavigationPage({super.key});
  /* 네비게이터
  *  - 플러터에서 화면 전환을 관리하는 위젯이다
  *  - 스택 구조를 사용하여 화면을 위에 쌓거나 아래로 제거함으로써 유저가 여러화면 사이를
  * 탐색훌 수 있게 도와준다
  *  - push 새로운 화면을 스택위에 추가
  *  - pop 스택에서 현재 화면 제거
  * */
  final List<Map<String,String>> products = [
    {"name": "Product 1", "description": "상품1의 상세 정보"},
    {"name": "Product 2", "description": "상품2의 상세 정보"},
    {"name": "Product 3", "description": "상품3의 상세 정보"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product["name"] ?? "이름없음"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage(productName: product['name']!, productDesciption: product["description"]!)),
            );
          },
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  final String productName;
  final String productDesciption;

  const DetailPage({
    super.key,
    required this.productName,
    required this.productDesciption,
  });
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(productName),
    ),
    body: Padding(padding: EdgeInsets.all(16),child: Text(productDesciption, style: TextStyle(fontSize: 20),)  ),
  );
}
}