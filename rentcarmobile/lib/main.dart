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
        scaffoldBackgroundColor: const Color.fromARGB(255, 40, 40, 40),
        fontFamily: 'Arapey',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 40, 40, 40),
        ),
        buttonTheme: const ButtonThemeData(),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Colors.white,
            fontSize: 24,          
          ),
        ),
        primaryColor: const Color.fromARGB(255, 40, 40, 40),
        highlightColor: const Color.fromARGB(255, 167, 117, 77)
      ),
      initialRoute: "/registerDriver",
      routes: {
        '/': (context) => const LoginScreen(),
        '/registerCustomer': (context) => const RegisterCustomerScreen(),
        '/registerDriver': (context) => const RegisterDriverScreen(),
        '/forgotPassword': (context) => const ForgotPasswordScreen()
      },
    );
  }
}
