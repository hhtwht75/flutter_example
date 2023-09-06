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

  void addContact ( inputName, inputAffiliation, inputNumber ) {
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
            return DialogUI( addContact: addContact );
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
  DialogUI({super.key, this.addContact});
  final addContact;

  final _formkey = GlobalKey<FormState>();

  final _inputName = TextEditingController();
  final _inputAffiliation = TextEditingController();
  final _inputNumber = TextEditingController();

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
                  key: _formkey,
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
                        controller: _inputName,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: '소속',
                          hintText: '한국전자',
                        ),
                        controller: _inputAffiliation,
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
                        controller: _inputNumber,
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
                            if (_formkey.currentState!.validate()) {
                              addContact(_inputName.text, _inputAffiliation.text, _inputNumber.text);
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
