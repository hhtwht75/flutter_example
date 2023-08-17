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
            foregroundColor: Colors.green,
            leading: Icon(Icons.attach_money_rounded),
            title: Text(
                'WHY NOT QUANT?',
                style: TextStyle(
                  // color: Colors.black,
                  fontWeight: FontWeight.bold,
                )
            ),
            // centerTitle: true,
            backgroundColor: Colors.white,
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
              IconButton(onPressed: (){}, icon: Icon(Icons.add_alert))
            ],
          ),

          body: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
              child: ExpansionTile(
                title: Text("퀀트전략을 선택하세요", textAlign: TextAlign.center),
                children: [
                  ListTile(title: Text("GAA", textAlign: TextAlign.center)),
                  ListTile(title: Text("GAA aggressive", textAlign: TextAlign.center)),
                ],
              ),
            ),
          ),

          bottomNavigationBar: BottomAppBar(
              color: Colors.green,
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
