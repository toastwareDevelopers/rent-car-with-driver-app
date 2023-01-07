// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rentcarmobile/constants/assets_path.dart';
import 'package:rentcarmobile/services/auth.dart';

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
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Forgot Password"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: phoneWidth,
            height: phoneHeight * 0.85,
            padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.1),
            child: Column(
              children: <Widget>[
                Expanded(flex: 4, child: Container()),
                Expanded(
                  flex: 4,
                  child: Image(
                    color: Colors.white,
                    alignment: Alignment.center,
                    height: 100.0,
                    width: 100.0,
                    image: AssetImage(AssetPaths.lockPhotoIconPath),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(
                      "Forgot your Password?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Enter your email below to reset your password",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            enableSuggestions: false,
                            autocorrect: false,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                InputValidator.validateEmail(value),
                            controller: widget.emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: phoneHeight * 0.01),
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  maximumSize: MaterialStatePropertyAll(
                                      Size.fromWidth(phoneWidth * 0.25))),
                              onPressed: () async {
                                if (widget.emailController.text.isEmpty == true) {
                                  WarningAlert.showWarningDialog(
                                      context,"Warning","Please enter your email!", () {
                                    Navigator.pop(context);
                                  });
                                } else if (InputValidator.validateEmail(widget.emailController.text) != "") {
                                  WarningAlert.showWarningDialog(
                                    context,"Warning",
                                    "Email format is wrong!",
                                    () {
                                      Navigator.pop(context);
                                    },
                                  );
                                } else {
                                  int status = await AuthService.resetPassword(
                                      widget.emailController.text);
                                  if (status == 200) {
                                    WarningAlert.showWarningDialog(
                                      context,"Success",
                                      "Your new password is sent to your email.",
                                      () {
                                        Navigator.pop(context);
                                      },
                                    );
                                  } else {
                                    WarningAlert.showWarningDialog(
                                      context,"Warning",
                                      "We can not reset your password now. Please try again later!",
                                      () {
                                        Navigator.pop(context);
                                      },
                                    );
                                  }
                                }
                              },
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 8, child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
