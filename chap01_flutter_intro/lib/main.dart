import 'package:flutter/material.dart';


//Flutter 어플리케이션 진입점이 되는 메서드
void main() {
  //주어진 위젯을 기준으로 위젯트리를 만든다
  runApp(const MyApp());
}
//앱의 전반적인 테마 설정 텍스트 스타일, 버튼스타일등등
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*
  * build()
  * - 위젯 트리를 구성하고 해당 트리를 기반으로 화면에 표시될 UI를 정의하는 메소드
  * */
  @override
  Widget build(BuildContext context) {
    /*
    * 메테리얼 - 안드로이드에 적용하려고 구글이 만든 디자인 규칙이다
    * 하지만 꼭 안드로이드 전용으로 동작하는 것은 아님
    * 플러터는 크로스 플랫폼 프레임워크이기 때문에 MeterialApp 을 사용한 앱도
    * IOS, 웹, 데스크 등 다양한 플랫폼에서 실행 가능하다
    * 
    * Flutter 어플리케이션은 Meterial Design을 기반으로
    * 전반적인 테마 라우팅 기본 스타일 및 네비게이션을 관리한다
    * 
    * 주요 속성
    * title = 앱의 제목을 설정
    * theme = 앱의 기본 테마 정의
    * home = 앱의 기본화면을 설정한다 일반적으로 첫번째 화면을 표시하는 위젯
    * routes = 라우팅을 정의하는데 사용
    * */
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: "첫 플루터"),
    );
  }
}
/*
* 위젯?
* - html의 개발장식은 태그
* - flutter는 위젯을 사용
*  글자넣고싶으면 tExt 이미지는 Image 네모박스는 혹은컨테이너는 container()
* */
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("flutter 앱"),),
      ),
      body: Center(
        child: Image.asset('asset/mcgrow.jpg'),
      ), // 여기에 괄호를 닫습니다
      bottomNavigationBar: BottomAppBar(
        child: Center(
          child: Text(
            "하단 네비비게이션 바",
            style: TextStyle(fontSize: 18),
          ),
        )
      ),
      
    ); // Scaffold를 닫는 괄호
  } // build 메서드를 닫는 괄호
} // MyHomePage 클래스를 닫는 괄호


