

import 'package:flutter/material.dart';

class Store extends ChangeNotifier{
  // 일반적인 Stroe 클래스 내부 변수는 private 처리하는 것이 관례이다

  int _count=0;
  int get count => _count;
  void incrementCount(){
    _count++;
    notifyListeners(); //상태 변경시 ui 업데이트를 위한 메서드
  }

}
class Store2 extends ChangeNotifier{
  int _count=100;
  int get count => _count;
  void incrementCount2(){
    _count--;
    notifyListeners(); //상태 변경시 ui 업데이트를 위한 메서드
  }

}
