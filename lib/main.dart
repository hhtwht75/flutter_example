import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = ['박정훈', '신유현', '심재선', '이상경'];
  var like = [0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){
            setState(() {
              a++;
            });
          },
        ),
        appBar: AppBar(
          title: Text(
            'WHY NOT QUANT?',
            style: TextStyle(fontWeight: FontWeight.w100),
          )
        ),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (c, i){
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(name[i]),
            );
          },
        ),
      )
    );
  }
}