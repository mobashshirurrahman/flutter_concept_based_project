import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_with_bloc/screens/authentication/bloc/sign_in_event.dart';

import 'bloc/sign_in_bloc.dart';
import 'bloc/sign_in_state.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              BlocConsumer<SignInBloc, SignInState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is ErrorState) {
                    return Text(
                      state.errorMessage,
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    );
                  }
                  return Text("");
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(
                        emailController.text, passwordController.text),
                  );
                },
                decoration: InputDecoration(hintText: "Email address"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                onChanged: (value) {
                  BlocProvider.of<SignInBloc>(context).add(
                    SignInTextChangedEvent(
                        emailController.text, passwordController.text),
                  );
                },
                decoration: InputDecoration(hintText: "Password"),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is LoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CupertinoButton(
                    onPressed: () {
                      if (state is ValidState) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInSubmittedChangedEvent(
                                emailController.text, passwordController.text));
                      }

                      // );
                    },
                    child: Text("Login"),
                    color: (state is ValidState) ? Colors.blue : Colors.grey,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
