
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPermissionPage extends StatefulWidget {
  const CameraPermissionPage({super.key});

  @override
  State<CameraPermissionPage> createState() => _CameraPermissionPageState();
}

class _CameraPermissionPageState extends State<CameraPermissionPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  /*
  *  XFile 은 flutter에서 주로 파일 선택기나 이미ㅣㅈ 파일을 다룰떄 사용하는 파일처리 클래스다
  * File 과 유사하지만 다양한 파일 작업을 수행할 수 있다.
  * */
  Future<void> _pickImage() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile!= null) {
      setState(() {
        _image = File(pickedFile.path);
        
      });
    }
  }
  Future<void> _pickImageFromCamera() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile!= null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _image == null ? Text("사진선택") : Image.file(_image!),
          SizedBox(height: 20),
          ElevatedButton(onPressed: _pickImageFromCamera, child: Text("카메라로 사진 찍기"))
        ],
      ),
    );
  }
}
