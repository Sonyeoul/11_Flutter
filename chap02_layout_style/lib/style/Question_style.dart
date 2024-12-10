import 'package:flutter/material.dart';

class MyQuestion extends StatelessWidget {
  const MyQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Text("실슬 앱")],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home),
            Icon(Icons.search),
            Icon(Icons.add),
            Icon(Icons.favorite),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset("asset/mcgrow.jpg"),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("MC Grow"),
                        Text("2023-01-01"),
                        Text("범죄자"),
                        Row(
                          children: [
                            Icon(Icons.favorite),
                            SizedBox(width: 4), // Add some space between the icon and the text
                            Text("4"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // The duplicated container is now below the first one
            Row(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset("asset/mcgrow.jpg"),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: 200,
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("MC Grow"),
                        Text("2023-01-01"),
                        Text("범죄자"),
                        Row(
                          children: [
                            Icon(Icons.favorite),
                            SizedBox(width: 4), // Add some space between the icon and the text
                            Text("4"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}