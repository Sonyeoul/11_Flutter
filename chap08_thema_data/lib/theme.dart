

import 'package:flutter/material.dart';

var theme = ThemeData(
  iconTheme: IconThemeData(color: Colors.blue, size: 50),
  appBarTheme: AppBarTheme(backgroundColor: Colors.lightBlueAccent),
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.green),
);

/* 동일성 있는 ui 디자인을 원한다면 ThemeData 를 활용하면된다
*  이렇게 전역적으로 기본 테마를 꾸며놓고 필요한 부분은 부분마다 커스텀하는 식으로 개발하면 생산성에 좋다
*/