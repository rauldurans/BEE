import 'package:flutter/material.dart';
import 'package:flutter_form_validator/main.dart';
import 'reusable_widgets.dart';

class Second extends StatefulWidget {
  const Second({Key key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SafeArea(
                child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('backgroudn2.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          logoWidget('Bee-pay-big.png'),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text("Welcome to BeePay"),
                          SizedBox(
                            height: 50,
                          ),
                          OutlinedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()));
                              },
                              icon: Icon(
                                Icons.exit_to_app,
                                size: 18,
                              ),
                              label: Text("Logout"))
                        ]))))));
  }
}
