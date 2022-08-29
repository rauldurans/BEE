import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_validator/main.dart';
import 'InputDeco_design.dart';
import 'package:http/http.dart' as http;

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/backgroudn2.png",
                  fit: BoxFit.cover,
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 70,
                  child: Image.asset("Bee-pay-op2.png"),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: name,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person, "Full Name"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      ;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.email, "Email"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please a Enter';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    onSaved: (String value) {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.number,
                    decoration: buildInputDecoration(Icons.phone, "Phone No"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter phone no ';
                      }
                      if (value.length > 9) {
                        return "please enter valid phone";
                      }
                      return null;
                    },
                    onSaved: (String value) {},
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: password,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.lock, "Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please a Enter Password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                  child: TextFormField(
                    controller: confirmpassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration:
                        buildInputDecoration(Icons.lock, "Confirm Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please re-enter password';
                      }
                      print(password.text);

                      print(confirmpassword.text);

                      if (password.text != confirmpassword.text) {
                        return "Password does not match";
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.amber,
                    onPressed: () {
                      if (_formkey.currentState.validate()) {
                        RegistrationUser();
                        print("successful");

                        return;
                      } else {
                        print("UnSuccessfull");
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        side: BorderSide(color: Colors.black, width: 2)),
                    textColor: Colors.black,
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future RegistrationUser() async {
    var APIURL = "https://admin.justbeesolutions.com/beeadmin/api/register";
    Map mapdate = {
      'name': name.text,
      'apellido': "Tellez",
      'cel': phone.text,
      'ci': "9621720",
      'fecha_nacimiento': "1999-12-18",
      'sexo': "F",
      'ciudad': "Santa Cruz",
      'pais': "Bolivia",
      'email': email.text,
      'password': password.text,
      'password_confirmation': confirmpassword.text
    };
    print("JSON DATA: ${mapdate}");
    http.Response response = await http.post(APIURL, body: mapdate);
    var data = jsonDecode(response.body);
    print("DATA: ${data}");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
}
