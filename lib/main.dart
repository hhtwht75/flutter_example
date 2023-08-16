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
        
        // body: Container(
        //   padding: EdgeInsets.all(20),
        //   decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        //   height: 250,
        //   width: double.infinity,
        //   child: Row(
        //     children: [
        //       Flexible(
        //         flex:3,
        //         child: Container(
        //           margin: EdgeInsets.fromLTRB(10,0,0,0),
        //           child: Image(
        //             alignment: Alignment.center,
        //             image: AssetImage('assets/wine.jpg'),
        //           ),
        //         ),
        //       ),
        //       Flexible(
        //         flex: 7,
        //         child: Padding(
        //           padding: const EdgeInsets.fromLTRB(20,20,10,20),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Expanded(
        //                 child: Text(
        //                   '캐논 DSLR 100D (단렌즈, 충전기 16기가SD 포함 솰라솰라솰라솰라)',
        //                   softWrap: true,
        //                   // overflow: TextOverflow.clip,
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 30,
        //                 child: Text('성동구 행당동 끌올 10분전')
        //               ),
        //               SizedBox(height: 30, child: Text('210,000원')),
        //               SizedBox(
        //                 height: 30,
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.end,
        //                   children: [
        //                     Icon(Icons.favorite_border),
        //                     Text('4')
        //                   ],
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        
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
