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
            title: Text('앱')
        ),
        body: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: double.infinity, height: 150, color: Colors.blue,
          ),
        ),
        
      )
    );
  }
}
