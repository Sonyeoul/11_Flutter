import 'package:flutter/material.dart';

class MyBar extends StatelessWidget {
  const MyBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("gangnamStagram"),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home),
            Icon(Icons.search),
            Icon(Icons.add),
            Icon(Icons.favorite),
            Icon(Icons.notifications),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: Container(
            color: Colors.blueAccent,
          )),
          Container(
            height: 100,
            child: Row(
              children: [
                Flexible(child: Container(color: Colors.yellow),flex: 2,),
                Flexible(child: Container(color: Colors.green), flex: 2,),
              ],
            ),
          )
        ],
      ),
    );
  }
}