import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/provider/home_page_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(20),
              child: ChangeNotifierProvider<HomePageProvider>(
                  create: ((context) => HomePageProvider()),
                  child: Consumer<HomePageProvider>(
                    builder: (context, provider, child) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(provider.eligiblityMessage.toString(),
                            style: TextStyle(
                              color: (provider.isEligible == true)
                                  ? Colors.green
                                  : Colors.red,
                            )),
                        TextField(
                          // keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Enter your Age",
                          ),
                          onChanged: ((value) {
                            provider.checkEligible(int.parse(value));
                          }),
                        )
                      ],
                    ),
                  )))),
    );
  }
}
