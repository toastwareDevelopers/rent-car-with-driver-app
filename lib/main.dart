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
          elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Color.fromARGB(255, 167, 117, 77),
              ),
              textStyle: MaterialStatePropertyAll(
                TextStyle(fontSize: 15, fontFamily: 'Arapey'),
              ),
            ),
          ),
          textTheme: const TextTheme(
            headlineMedium: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color.fromARGB(255, 218, 218, 218),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 167, 117, 77), width: 7.0),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color.fromARGB(255, 167, 117, 77),
          ),
          primaryColor: const Color.fromARGB(255, 40, 40, 40),
          highlightColor: const Color.fromARGB(255, 167, 117, 77)),
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
