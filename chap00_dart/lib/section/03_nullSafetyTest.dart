
void nullSafetyTest(){
  /* Dart에서는 기본적으로 변수를 선언할때
  * 초기화를 하지 않으면 에러가 나도록 되어있다
  * null-aware 연산자를 통해 Null 처리를 고려할 수 있다.
  *
  * ??=
  * null 병합 할당
  * null이 할당되어 있는 경우에만 값을 할당하는 연산자
  * 기본값을 설정하거나 초기값을 주는데 유용하다
  * 사용자가 입력하지 않거나 값이 null인 경우에 자동으로 기본값을 할당할 수 있다*/

  String? val1;
  String val="not null";

  val1 ??= "null값이여서 할당";
  val ??= "null이 아니라서 할당안됨";
  print(val1); // null값이여서 할당
  print(val); // null이 아니라서 할당안��


  int x = 10;
  if(x is int) {
    print(x);
  }

  //스프레드 연산자
  var list = [1, 2, 3];
  var spreadList = [...list,if(list.length<5){4}];
  print(spreadList); // [1, 2, 3, 4]

}