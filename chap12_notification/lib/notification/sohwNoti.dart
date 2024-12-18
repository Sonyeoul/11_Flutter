
//알림 설정
import 'package:chap12_notification/notification/initNoti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

showNotification() async{
  //안드로이드 알림설정
  // 특정 알림 태널에 등록을 해 주어야한다

  var androidDetails = AndroidNotificationDetails(
    "test_Id",
    "테스트채널",
    priority: Priority.max,
    color: Colors.black,
  );
  //애플
  var iosDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentSound: true,
    presentBadge: true,
  );

  notifications.show(1, '전자문서 안내', '확인좀 이놈아', NotificationDetails(android: androidDetails, iOS: iosDetails),
  payload: "test_payload");
}