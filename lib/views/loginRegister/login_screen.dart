// ignore_for_file: must_be_immutable, prefer_const_constructors, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/models/login.dart';
import 'package:rentcarmobile/services/auth.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';
import '../../utils/input_validator.dart';

class LoginScreen extends StatefulWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Login login = Login();

  @override
  Widget build(BuildContext context) {
    // Next two variables could be used to make the login screen more versatile
    //double phoneHeight = MediaQuery.of(context).size.height;
    //double phoneWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 120,
                  ),
                  // APP TITLE
                  Text(
                    "RentaGO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        // EMAIL
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          enableSuggestions: false,
                          autocorrect: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              InputValidator.validateEmail(value),
                          controller: widget.emailController,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Email',
                            labelStyle: TextStyle(fontSize: 20.0),
                          ),
                        ),

                        SizedBox(
                          height: 5,
                        ),

                        //PASSWORD
                        TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: widget.passwordController,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'\s')),
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        // LOGIN BUTTON
                        // Have to connect with the backend to authenticate the user
                        // This part is uncompleted!!!
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              //backgroundColor: Colors.green,
                              //padding: EdgeInsets.all(20.0),
                              ),
                          onPressed: () async {
                            // If either (email and password) are not filled
                            if (widget.emailController.text.isEmpty ||
                                widget.passwordController.text.isEmpty) {
                              WarningAlert.showWarningDialog(
                                  context,"Warning", "Please fill al inputs!", () {
                                Navigator.pop(context);
                              });
                              // If email format is wrong
                            } else if (!RegExp(
                                    r"""^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
                                .hasMatch(widget.emailController.text)) {
                              WarningAlert.showWarningDialog(
                                  context, "Warning","Email format is wrong!", () {
                                Navigator.pop(context);
                              });
                            } else {
                              login.email =
                                  widget.emailController.text.toString();
                              login.password =
                                  widget.passwordController.text.toString();
                              Response response =
                                  (await AuthService.login(login));
                              if (response.statusCode != 200) {
                                WarningAlert.showWarningDialog(
                                  context,"Warning",
                                  response.body.split("\"")[3],
                                  () {
                                    Navigator.pop(context);
                                  },
                                );
                              } else {
                                //driver
                                if (json.decode(response.body)["role"] ==
                                    "driver") {
                                  RentVanApp.userId =
                                      json.decode(response.body)["_id"];
                                  RentVanApp.userType = "driver";
                                  Navigator.pushNamed(context, "/driverMain");
                                }
                                //customer
                                else {
                                  RentVanApp.userType = "customer";
                                  RentVanApp.userId =
                                      json.decode(response.body)["_id"];
                                  Navigator.pushNamed(context, "/customerMain");
                                }
                              }
                            }
                          },
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // FORGOT PASSWORD
                        TextButton(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          onPressed: () async {
                            Navigator.of(context).pushNamed(
                              "/forgotPassword",
                            );
                          },
                        ),
                        // DIVIDER
                        // I have to deal with colors
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 100.0, right: 15.0),
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                  height: 40,
                                ),
                              ),
                            ),
                            // I have to deal with colors
                            Text(
                              "OR",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                              selectionColor: Colors.white,
                            ),
                            // I have to deal with colors
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 100.0,
                                ),
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                  height: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // I have to deal with colors
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // REGISTER CUSTOMER
                            // I have to deal with colors
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  //backgroundColor: Colors.brown,
                                  ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  "/registerCustomer",
                                );
                              },
                              child: Text(
                                "Register as Customer",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),

                            // REGISTER DRIVER
                            // I have to deal with colors
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(),
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  "/registerDriverAuth",
                                );
                              },
                              child: Text(
                                "Register as Driver",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
