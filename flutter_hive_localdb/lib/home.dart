import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _myBox = Hive.box("myBox");

  Future<void> writeData() async {
    // await Hive.openBox("myBox");
    _myBox.put(1, "mob");
  }

  Future<void> readData() async {
    // await Hive.openBox("myBox");
    _myBox.get(1);
    Fluttertoast.showToast(
        msg: _myBox.get(1),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> deleteData() async {
    // await Hive.openBox("myBox");
    print(_myBox.delete(1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          MaterialButton(
            onPressed: readData,
            child: Text("Read"),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: writeData,
            child: Text("Write"),
            color: Colors.green,
          ),
          MaterialButton(
            onPressed: deleteData,
            child: Text("Delete"),
            color: Colors.red,
          ),
        ]),
      ),
    );
  }
}
