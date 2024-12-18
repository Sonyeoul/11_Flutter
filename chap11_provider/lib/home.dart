
import 'package:chap11_provider/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);
    var store2 = Provider.of<Store2>(context);
    return Scaffold(
      appBar: AppBar(title: Text('스토어 관리')),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text("카운트 값 : ${store.count}"),
              ElevatedButton(
                onPressed: ()=> store.incrementCount(),
                child: Text('증가'),
              ),
              Text("카운트 값 : ${store2.count}"),
              ElevatedButton(
                onPressed: ()=> store2.incrementCount2(),
                child: Text('증가'),
              ),
            ],
          )
      ),
    );
  }
}
