import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('퀀트 매니저'),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Container(
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              // width: 300,
              child: ExpansionTile(
                title: Text("퀀트전략을 선택하세요"),
                children: [
                  ListTile(title: Text("GAA")),
                  ListTile(title: Text("GAA aggressive")),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.orange,
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.arrow_back),
                Icon(Icons.home),
                Icon(Icons.arrow_forward),
              ]
            ),
          )
        ),
      )
    );
  }
}
