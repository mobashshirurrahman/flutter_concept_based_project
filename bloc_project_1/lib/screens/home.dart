import 'package:bloc_project_1/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloc_project_1/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetBloc, InterentState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Internet Connected"),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 5),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                // ignore: prefer_const_constructors
                SnackBar(
                  content: Text("Internet Not Connected"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return Text("Connected");
            } else if (state is InternetLostState) {
              // print(state);
              return Text("No Intenet connections...");
            } else {
              return Text("Checking intenet....");
            }
          },
        ),

        // child: BlocBuilder<InternetBloc, InterentState>(
        //   // BlocBuilder make UI in screen

        //   builder: (context, state) {
        //
        //   },
        // ),
      )),
    );
  }
}
