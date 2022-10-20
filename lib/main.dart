import 'package:flutter/material.dart';
import 'package:rentcarmobile/views/loginRegister/forgotpassword_screen.dart';
import 'package:rentcarmobile/views/loginRegister/login_screen.dart';
import 'package:rentcarmobile/views/loginRegister/register_customer.dart';
import 'package:rentcarmobile/views/loginRegister/register_driver.dart';

void main() {
  runApp(const RentVanApp());
}

class RentVanApp extends StatelessWidget {
  const RentVanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent Van App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
        buttonTheme: const ButtonThemeData(),
        textTheme: const TextTheme(),
      ),
      initialRoute: "/",
      routes: {
        '/' :(context) => const LoginScreen(),
        '/registerCustomer' :(context) => const RegisterCustomerScreen(),
        '/registerDriver' :(context) => const RegisterDriverScreen(),
        '/forgotPassword' :(context) => const ForgotPasswordScreen()
      },
    );
  }
}
