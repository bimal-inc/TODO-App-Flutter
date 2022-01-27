import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var listofTODO = ['', ''];
  addToDO(String item) {
    setState(() {
      listofTODO.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    String value;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("TODO App "),
        ),
        drawer: Drawer(),
        body: ListView.builder(
            itemCount: listofTODO.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        onChanged: (val) {
                          value = val;
                        },
                      ))
                  : ListTile(
                      leading: Icon(Icons.work),
                      title: Text("${listofTODO[index]}"),
                    );
            }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: addToDO(value),
        ),
      ),
    );
  }
}
