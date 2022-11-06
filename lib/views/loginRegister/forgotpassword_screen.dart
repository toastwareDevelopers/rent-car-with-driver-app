// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../utils/input_validator.dart';
import '../../utils/warning_alert.dart';

class ForgotPasswordScreen extends StatefulWidget {
  TextEditingController emailController = TextEditingController();
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen"),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                
                Image(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage('lib/assets/images/lock.png'),
                ),

                SizedBox(
                  height: 80,
                ),

                Text(
                  "Forgot your Password?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),

                SizedBox(
                  height: 20,
                ),

                Text(
                  "Enter your email below to reset your password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),

                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          enableSuggestions: false,
                          autocorrect: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              InputValidator.validateEmail(value),
                          controller: widget.emailController,
                          decoration: InputDecoration(
                            //prefixIcon: Icon(Icons.person),
                            labelText: 'Email',
                            labelStyle: TextStyle(fontSize: 20.0),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        ElevatedButton(
                          onPressed: () {
                            if(widget.emailController.text.isEmpty == true) {
                              WarningAlert.showWarningDialog(
                                  context, "Please enter your email!",(){Navigator.pop(context);});
                            } else if(!RegExp(r"""
^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
                                .hasMatch(widget.emailController.text)) {
                              WarningAlert.showWarningDialog(
                                  context, "Email format is wrong!",(){Navigator.pop(context);});
                            } else {
                              // backend related
                            }
                          },

                          child: SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
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
