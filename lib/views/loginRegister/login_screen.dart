// ignore_for_file: must_be_immutable, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
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

    return Scaffold(
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
                  "RENTAGO",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.white),
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
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: 20.0),
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
                                context, "Please fill al inputs!");
                            // If email format is wrong
                          } else if (!RegExp(r"""
^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
                              .hasMatch(widget.emailController.text)) {
                            WarningAlert.showWarningDialog(
                                context, "Email format is wrong!");
                            // This is the backend part!!!
                          } else {
                            login.email =
                                widget.emailController.text.toString();
                            login.password =
                                widget.passwordController.text.toString();

                            if (await AuthService.loginAuth(login) != 200) {
                              WarningAlert.showWarningDialog(context,
                                  "There is no such user in the system!");
                            } else {
                              
                            }
                          }
                        },
                        child: Container(
                          height: 50,
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),
                        ),
                      ),

                      // FORGOT PASSWORD
                      TextButton(
                        child: Text("Forgot Password?", style: TextStyle(fontSize: 15.0),),
                        onPressed: () async {
                          Navigator.of(context).pushNamed(
                            "/forgotPassword",
                          );
                        },
                      ),

                      //SizedBox(height: 50,),

                      // DIVIDER
                      // I have to deal with colors
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 15.0),
                              child: Divider(
                                //color: Color.fromARGB(255, 167, 117, 77),
                                color: Colors.black,
                                thickness: 1,
                                height: 40,
                              ),
                            ),
                          ),
                          // I have to deal with colors
                          Text(
                            "OR",
                            style: TextStyle(fontSize: 20.0),
                            selectionColor: Colors.black,
                            //selectionColor: Color.fromARGB(255, 167, 117, 77),
                          ),
                          // I have to deal with colors
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 15.0, right: 10.0),
                              child: Divider(
                                //color: Color.fromARGB(255, 167, 117, 77),
                                color: Colors.black,
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
                              style: TextStyle(fontSize: 15.0),
                            ),
                          ),

                          // REGISTER DRIVER
                          // I have to deal with colors
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                //backgroundColor: Colors.brown,
                                ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                "/registerDriverAuth",
                              );
                            },
                            child: Text(
                              "Register as Driver",
                              style: TextStyle(fontSize: 15.0),
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
    );
  }
}
