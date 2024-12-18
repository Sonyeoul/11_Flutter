// 알림 플러그인 인스턴스 생성

import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();

initNotification() async {
  //안드로이드 초기화 설정
  var androidInitialization = AndroidInitializationSettings("app_icon");
  //ios 설정
  var iosSetting = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  var initializationSettings = InitializationSettings(android: androidInitialization, iOS: iosSetting);
  await notifications..initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response){
      print("알림 클릭 ${response.payload}");
    }
  );
  //안드로이드 알림 채널 생성
  var androidChannel = AndroidNotificationChannel(
    "test_Id", // 체널 아이디는 중복되면안됨
    "테스트채널",
    description: "알림에 대한 설정",
    importance: Importance.max, // 알림 중요도 설정
    playSound: true, //소리설정
    enableVibration: true, //진동
    vibrationPattern: Int64List.fromList([0,1000]), //진동 패턴
  );
  //채널 등록
  try {
    await notifications.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(androidChannel);
    print("테스트 채널 생성완료");
  }catch(e){
    print("테스트 채널 생성 오류 : $e");
  }


}