import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentcarmobile/utils/warning_alert.dart';

import '../../../main.dart';
import '../../../models/driver.dart';
import '../../../services/profile.dart';

class EditDriverAuthScreen extends StatefulWidget {
  static var editDriver = Driver();
  EditDriverAuthScreen({super.key});

  @override
  State<EditDriverAuthScreen> createState() => _EditDriverAuthScreenState();
}

class _EditDriverAuthScreenState extends State<EditDriverAuthScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  Size size = WidgetsBinding.instance.window.physicalSize;
  double ratio = WidgetsBinding.instance.window.devicePixelRatio;
  double phoneHeight = 0.0;
  double phoneWidth = 0.0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getDriver(); // get driver data
    phoneHeight = size.height / ratio;
    phoneWidth = size.width / ratio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0),
      body: isLoading ?
          const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: SizedBox(
          height: phoneHeight,
          width: phoneWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.only(top: phoneHeight * 0.08),
                  child: Text(
                    "Edit Driver",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(
                      left: phoneWidth * 0.07, right: phoneWidth * 0.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Email - Uneditable
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          autofocus: false,
                          readOnly: true,
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: EditDriverAuthScreen.editDriver.email,
                          ),
                        ),
                      ),
                      //Phone Number -Uneditable
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          autofocus: false,
                          readOnly: true,
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: EditDriverAuthScreen.editDriver.phoneNumber,
                          ),
                        ),
                      ),
                      //Password - Editable
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            //Password - Editable
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                                ],
                                decoration: const InputDecoration(
                                  hintText: "Password",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: phoneWidth * 0.04,
                            ),
                            //Retype Password - Editable
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: repasswordController,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                                ],
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
              //Continue Button
              Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    child: const Text("Continue"),
                    onPressed: () async {
                      if (!controlIsSamePasswordAndRePassword(
                          passwordController.text, repasswordController.text)) {
                        WarningAlert.showWarningDialog(context,
                            "Master Password must be same as confirmation ,but was different!",
                            () {
                          Navigator.pop(context);
                        });
                        // Get to the next screen
                      } else {
                        EditDriverAuthScreen.editDriver.password = passwordController.text;
                        Navigator.of(context).pushNamed('/editDriverPersonal');
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

  bool controlIsSamePasswordAndRePassword(String password, String rePassword) {
    return password == rePassword;
  }

  getDriver() async {
    setState(() {
      isLoading = true;
    });
    final response = await ProfileService.getDriver(RentVanApp.userId);
    EditDriverAuthScreen.editDriver = response;
    setState(() {
      isLoading = false;
    });
  }
}
