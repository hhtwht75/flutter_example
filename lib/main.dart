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
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10,0,20,0),
              child: Text(
                "Contact",
                style: TextStyle(fontWeight: FontWeight.w100),
              ),
            ),
            Text(
              "( ${name.length} )",
              style: TextStyle(fontWeight: FontWeight.w100),
            ),
          ],
        )
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (c, i){
          return ListTile(
            leading: Icon(Icons.account_circle),
            title: Row(
              children: [
                SizedBox(width: 50, child: Text(name[i])),
                SizedBox(width: 100, child: Text(affiliation[i])),
                SizedBox(child: Text(number[i]))
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.edit)
                ),
                IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.delete_outline)
                )
              ]
            )
          );
        },
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({super.key, this.addName});
  final addName;

  final formkey = GlobalKey<FormState>();

  final inputName = TextEditingController();
  final inputAffiliation = TextEditingController();
  final inputNumber = TextEditingController();

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
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: '이름 *',
                          hintText: '홍길동',
                        ),
                        validator: (value) {
                          return (value!.isEmpty) ? '이름을 입력해주세요' : null;
                        },
                        controller: inputName,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        validator: (value) {
                          return (value!.isEmpty) ? '연락처를 입력해주세요' : null;
                        },
                        controller: inputNumber,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ]
                  ),
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
                            if (formkey.currentState!.validate()) {
                              addName(inputName.text, inputAffiliation.text, inputNumber.text);
                              Navigator.of(context).pop();
                            }
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
