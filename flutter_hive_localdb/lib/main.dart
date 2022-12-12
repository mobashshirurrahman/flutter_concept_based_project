import 'package:flutter/material.dart';
import 'package:flutter_hive_localdb/home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  var box = await Hive.openBox('myBox');

  // box.put('name', 'David');

  // print('Name: ${box.get('name')}');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      // themeMode: ThemeMode.dark,
      themeMode: ThemeMode.system,

      debugShowCheckedModeBanner: false,

      routes: {
        "/": (context) => Home(),
      },
    );
  }
}
