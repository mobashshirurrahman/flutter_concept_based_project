import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_with_bloc/screens/authentication/bloc/sign_in_bloc.dart';
import 'package:form_validation_with_bloc/screens/authentication/login.dart';
import 'package:bloc/bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => BlocProvider(
                        create: (BuildContext context) => SignInBloc(),
                        child: Login()),
                  ),
                );
              }),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey),
              ),
              child: Text("Login with Email"),
            ),
            ElevatedButton(
                onPressed: (() {}),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: Text("Login with Google Account"))
          ],
        ),
      ),
    );
  }
}
