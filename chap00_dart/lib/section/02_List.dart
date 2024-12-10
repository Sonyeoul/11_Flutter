

/*
* Dart 는 배열은 따로 제공하지 않는다
* list 와 map 을 제공하고, 데이터의 추가 조회 수정 삭제가 가능하다
* */
void collectionTest(){
  print("---list");

  List<String> food = ["장족","유족"];
  List<String> foods = ["동파육","탕수육"];
  List<String> category = foods;
  category = food + foods;

  print(food);
  print(foods);
  print(category);

  // foods.remove('동파육');
  // foods.removeAt(0);
  category.add(foods[0]);
  print(category);
  print("----map");

  Map<String, dynamic> person = {'1호':'영철', '2호':'영민'};
  print(person['1호']);
  //없는값을 조회해도 에러없음
  print(person['3호']);
  person['3호'] = ["히나",'수우나'];
  print(person['3호']);
  print(person.entries);

}