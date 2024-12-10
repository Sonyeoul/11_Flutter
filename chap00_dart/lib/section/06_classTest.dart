void classTest(){

}

class Human{
  String name;
  int age;
  // 다트에서는 동일한 이름을 가진 생성자를 만들수 없고
  //공식문서를 기준으로 매개변수를 받는 생성자를 권장한다.
  Human(this.name, this.age);

  //명명된 생성자, 초기화 리스트
  //생성자가 실행되기 전에 클래스의 변수를 초기화 하는 방법
  //: 뒤에 변수 초기화를 나열한다.
  Human.empty()
  :name = "", age = 0;

  String doHello(){
    return "Hello, ${name}! I'm ${age} years old.";
   }
 }
 class Human2{
  // _ > private
  String _name;
  int _age;
  Human2(this._name, this._age);

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}