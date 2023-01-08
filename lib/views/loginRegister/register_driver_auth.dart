import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentcarmobile/services/auth.dart';
import 'package:rentcarmobile/utils/input_validator.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';

import '../../models/driver.dart';

class RegisterDriverAuthScreen extends StatefulWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  RegisterDriverAuthScreen({super.key});
  @override
  State<RegisterDriverAuthScreen> createState() =>
      _RegisterDriverAuthScreenState();
}

class _RegisterDriverAuthScreenState extends State<RegisterDriverAuthScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: SingleChildScrollView(
        child: Container(
          height: phoneHeight,
          width: phoneWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Register as a Driver yazan başlık
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.only(top: phoneHeight * 0.08),
                  child: Text(
                    "Register as a Driver",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              //Form inputları alanı
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(
                      left: phoneWidth * 0.07, right: phoneWidth * 0.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Email
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            hintText: "Email",
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              InputValidator.validateEmail(value),
                          controller: widget.emailController,
                        ),
                      ),
                      //Phone Number
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            hintText: "Phone Number",
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              InputValidator.validatePhoneNumber(value),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9]"),
                            ),
                          ],
                          controller: widget.phoneNumberController,
                        ),
                      ),
                      //Password - retype password
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            //Password
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: widget.passwordController,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: const InputDecoration(
                                  hintText: "Password",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: phoneWidth * 0.04,
                            ),
                            //Re-type password
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: widget.repasswordController,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: const InputDecoration(
                                  hintText: "Retype Password",
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
              SizedBox(
                height: phoneHeight * 0.01,
              ),
              //Continue butonu alanı
              Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    child: const Text("Continue"),
                    onPressed: () async {
                      if (!controlInputsAreNotEmpty(
                          widget.emailController.text,
                          widget.phoneNumberController.text,
                          widget.passwordController.text,
                          widget.repasswordController.text)) {
                        WarningAlert.showWarningDialog(
                            context, "Warning","Please fill all inputs!",(){Navigator.pop(context);});
                      }
                      //If password and repassword is not equal
                      else if (!controlIsSamePasswordAndRePassword(
                          widget.passwordController.text,
                          widget.repasswordController.text)) {
                        WarningAlert.showWarningDialog(
                            context, "Warning","Password and repassword must be same!",(){Navigator.pop(context);});
                      } else if (widget.passwordController.text.length < 8) {
                        WarningAlert.showWarningDialog(
                            context, "Warning","Password has to be atleast 8 characters!",(){Navigator.pop(context);});
                      }
                      //If email format is not true
                      else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(widget.emailController.text)) {
                        WarningAlert.showWarningDialog(
                            context,"Warning", "Email format is wrong!",(){Navigator.pop(context);});
                      }
                      //Control email and phone number
                      else {
                        if ((await AuthService.controlEmailPhone(
                                widget.emailController.text,
                                widget.phoneNumberController.text)) !=
                            200) {
                          WarningAlert.showWarningDialog(context,"Warning",
                              "There is a user with same email or phone number",(){Navigator.pop(context);});
                        } else {
                          Navigator.of(context).pushNamed(
                            "/registerDriverPersonal",
                            arguments: Driver(
                              email: widget.emailController.text,
                              phoneNumber: widget.phoneNumberController.text,
                              password: widget.passwordController.text,
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool controlInputsAreNotEmpty(
      String email, String phoneNumber, String password, String repassword) {
    return email.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        password.isNotEmpty &&
        repassword.isNotEmpty;
  }

  bool controlIsSamePasswordAndRePassword(String password, String rePassword) {
    return password == rePassword;
  }
}
