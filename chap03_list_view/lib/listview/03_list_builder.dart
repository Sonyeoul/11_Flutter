
import 'package:flutter/material.dart';

class ListApp3 extends StatelessWidget {
  const ListApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('List Test'),
            ),
          ),
          body: ListViewWidget(),
          floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),
          backgroundColor: Colors.black,),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home),
                Icon(Icons.search),
                Icon(Icons.star),
              ],
            )
          ),
        );
  }
}

/* ListView.builder() 위젯 안에 2가지 속성을 지정해주면된다
* itemCount: 리스트 갯수
* itemBuilder (){return 반복할 위젯}
* i 라는 변수는 자동생성
* */
class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, i) {
        print('item $i');
        return ListTile(
          title: Text('Item $i'),
          leading: Image.asset('asset/zzz.jpg'),
          trailing: Text('국힘'),
        );
      },
    );
  }
}

