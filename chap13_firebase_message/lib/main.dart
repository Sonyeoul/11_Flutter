
/*
* firebase
*  구글에서 제공하는 클라우드 기반 어플리케이션 개발 플랫폼
*  다양한 도구와 서비스를 제공하여 개발 시간을단축하고 효율성을 높일 수 있다
*
* db, 인증, 서버가 없을 시 백엔드 코드 실행 등도 제공하지만
* 우리는 spring 과 mysql 을 사용하므로 우리는 알림만 사용해 볼것
* 클라우드 저장소도 1기가 무료로 제공한다
* firebase cloud messaging FCM
* 무료로 푸시 알람 서비스, 사용자에게 실시간 메시지를 보낼 수 있다
* */

import 'package:chap13_firebase_message/screen/screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen()
    );
  }
}
