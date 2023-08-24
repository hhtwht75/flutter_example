import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp( home: MyApp() )
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var num = 3;
  var name = ['박상기', '김옥순', '박정훈'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (matContext){
            return DialogUI(num: num);
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
        itemCount: num,
        itemBuilder: (c, i){
          return ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(name[i]),
          );
        },
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  const DialogUI({super.key, this.num});
  final num;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Container(
          height: 200,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: 50,
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: Text('Contact', style: TextStyle(fontSize: 20))
              ),
              Expanded(
                  child: Center(child: TextField())
              ),
              SizedBox(
                // height: 50,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(num.toString()),
                      TextButton(
                          onPressed: (){ Navigator.of(context).pop(); },
                          child: Text('Cancel')
                      ),
                      TextButton(onPressed: (){}, child: Text('OK')),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
