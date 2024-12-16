
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts=[];


  //위젯이 호출되고 제일 먼저 실행될 메서드
  @override
  void initState() {
    super.initState();
    _cheackAndFetchContacts();
  }
  //연락처를 동적으로 추가하기 위한 메서드

  addContact(a){
    setState(() {
      _contacts.add(a);
    });
  }
  //권함 체크 및 연락처 가져오는 메서드
  Future<void> _cheackAndFetchContacts() async {
    //연락처 접근 권한 요청
    PermissionStatus permission = await Permission.contacts.request();
    if(permission.isGranted){
      _getContacts();
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('연락처 권한이 필요합니다.'),));
    }
  }
  /*
  *  연락처 가져오기
  * var contacts = await FlutterContacts.getContacts
  *  그런데 연락처에 저장된 썸네일 이미지나 다른 정보들까지 가져오면
  * 느려지기 때문에 이름과 전화번호같은 properties만 가져오게 설정함*/
  Future<void> _getContacts() async {
    try{
      final List<Contact> contacts = await FlutterContacts.getContacts(
        withProperties: true, withPhoto: false
      );
      setState(() {
        _contacts = contacts;
      });
    }catch(e){
      print('Error : $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //연락처 목록표시 영역
        Expanded(child: ListView.builder(
          itemCount: _contacts.length,
          itemBuilder: (context, index) {
            var contact = _contacts[index];
            return ListTile(
              title: Text(contact.displayName),
              subtitle: Text(contact.phones.isNotEmpty? contact.phones[0].number : '전화번호 없음'),
            );
          }
        ))
      ],
    );
  }
}
