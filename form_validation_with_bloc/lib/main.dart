import 'package:flutter/material.dart';
import 'package:form_validation_with_bloc/screens/authentication/login.dart';
import 'package:form_validation_with_bloc/screens/welcome/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Home(),
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
      },
    );
  }
}
