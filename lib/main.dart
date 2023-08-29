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

  var name = [];
  var num = 0;

  void addName ( input ) {
    setState(() {
      name.add(input);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (context){
            return DialogUI( addName: addName );
          });
        },
      ),
      appBar: AppBar(
        title: Text(
          num.toString(),
          style: TextStyle(fontWeight: FontWeight.w100),
        )
      ),
      body: ListView.builder(
        itemCount: name.length,
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
  DialogUI({super.key, this.addName});
  final addName;

  var textInput = TextEditingController();

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
              Expanded( child: Center(child: TextField( controller: textInput )) ),
              SizedBox(
                // height: 50,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: (){ Navigator.of(context).pop(); },
                          child: Text('Cancel')
                      ),
                      TextButton(
                          onPressed: (){
                            addName(textInput.text);
                            Navigator.of(context).pop();
                          },
                          child: Text('OK')
                      ),
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
