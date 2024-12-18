
import 'package:chap12_notification/notification/sohwNoti.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

//
// class NotiTestScreen extends StatefulWidget {
//   const NotiTestScreen({super.key});
//
//   @override
//   State<NotiTestScreen> createState() => _NotiTestScreenState();
// }
//
// class _NotiTestScreenState extends State<NotiTestScreen> {
//
//
//   @override
//   void initState() {
//     super.initState();
//     requestNotificationPermission();
//   }
//
//   Future<void> requestNotificationPermission() async {
//     if(await Permission.notification.isDenied){
//       await Permission.notification.request();
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Notification Test')),
//       body: Center(
//         child: ElevatedButton(onPressed: (){
//           showNotification();
//         }, child: Text("알람 보내기")),
//       ),
//     );
//   }
// }

//chap2
class NotiTestScreen extends StatefulWidget {
  const NotiTestScreen({super.key});

  @override
  State<NotiTestScreen> createState() => _NotiTestScreenState();
}

class _NotiTestScreenState extends State<NotiTestScreen> {


  @override
  void initState() {
    super.initState();
    requestNotificationPermission();
  }

  Future<void> requestNotificationPermission() async {
    if(await Permission.notification.isDenied){
      await Permission.notification.request();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Test')),
      body: Center(
        child: ElevatedButton(onPressed: (){
          showNotification();
        }, child: Text("알람 보내기")),
      ),
    );
  }
}
