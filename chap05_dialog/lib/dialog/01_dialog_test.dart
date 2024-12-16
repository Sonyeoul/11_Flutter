import 'package:flutter/material.dart';

//showDialog() - 플러터가 제공하는 기본 함수 context 넣어줘야함


class DialogTest extends StatelessWidget {
  const DialogTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: (){
          showDialog(context: context, builder: (context){
            return Dialog(
              child: Container(
                width: 150,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("하이요"),Text("아니요")
                  ],
                ),
              ),
            );
          });
        }, child: Text("버튼",style: TextStyle(fontSize: 30),),
      ),
    );
  }
}
