import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rentcarmobile/constants/assets_path.dart';
import 'package:rentcarmobile/services/auth.dart';

class RegisterDriverAuthScreen extends StatefulWidget {
  const RegisterDriverAuthScreen({super.key});
  @override
  State<RegisterDriverAuthScreen> createState() => _RegisterDriverAuthScreenState();
}

class _RegisterDriverAuthScreenState extends State<RegisterDriverAuthScreen> {
  @override
  void initState() {
    AuthService.login();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Register as a Driver yazan başlık
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(top: phoneHeight * 0.08),
              child: Text(
                "Register as a Driver Auth",
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
                  //Email or Phone Number
                  Row(
                    children: const [
                      //Email or Phone Number
                      Expanded(
                        flex: 1,
                        child: TextField(
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText: "Email or Phone Number",
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: phoneHeight*0.03,),
                  //Password - retype password
                  Row(
                    children: [
                      //Password
                      const Expanded(
                        flex: 1,
                        child: TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: phoneWidth * 0.04,
                      ),
                      //Re-type password
                      const Expanded(
                        flex: 1,
                        child: TextField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            hintText: "Retype Password",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //Continue butonu alanı
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                child: const Text("Continue"),
                onPressed: () {Navigator.of(context).pushNamed("/registerDriverPersonal");},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
