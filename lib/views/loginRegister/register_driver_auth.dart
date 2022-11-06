import 'package:flutter/material.dart';




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
      appBar: AppBar(
        title: const Text("Register Driver Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[Text("Register Driver Screen")],
        ),
      ),
    );
  }
}
