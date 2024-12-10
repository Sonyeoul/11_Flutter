void functionTest(){
  test1("홍익");

  print(add2(10, 20));
}
void test1(String name){
  print("Hello, " + name);
}

String add2(int a, int b,[int c = 0]){
  //c 는 있어도 되고 없어도된다.
  int sum = a + b + c;
  return sum.toString();
}