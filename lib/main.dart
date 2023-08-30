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
  var affiliation = [];
  var number = [];
  var num = 0;

  void addName ( inputName, inputAffiliation, inputNumber ) {
    setState(() {
      name.add(inputName);
      affiliation.add(inputAffiliation);
      number.add(inputNumber);
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
          name.length.toString(),
          style: TextStyle(fontWeight: FontWeight.w100),
        )
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (c, i){
          return ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(name[i]),
            subtitle: Text(affiliation[i]),
            trailing: Text(number[i]),
          );
        },
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({super.key, this.addName});
  final addName;

  var inputName = TextEditingController();
  var inputAffiliation = TextEditingController();
  var inputNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: Container(
          height: 500,
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
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: '이름 *',
                        hintText: '홍길동',
                      ),
                      validator: (String? value) {
                        return (value != null) ? '이름을 입력해주세요' : null;
                      },
                      controller: inputName,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: '소속',
                        hintText: '한국전자',
                      ),
                      controller: inputAffiliation,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: '연락처 *',
                        hintText: '010-1234-5678',
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (String? value) {
                        return (value != null) ? '연락처를 입력해주세요' : null;
                      },
                      controller: inputNumber,
                    ),
                  ]
                )
              ),
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
                            addName(inputName.text, inputAffiliation.text, inputNumber.text);
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
