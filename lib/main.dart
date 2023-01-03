import 'package:flutter/material.dart';
import 'package:rentcarmobile/views/chat/chat.dart';
import 'package:rentcarmobile/views/chat/message_screen.dart';
import 'package:rentcarmobile/views/loginRegister/forgotpassword_screen.dart';
import 'package:rentcarmobile/views/loginRegister/login_screen.dart';
import 'package:rentcarmobile/views/loginRegister/register_customer.dart';
import 'package:rentcarmobile/views/loginRegister/register_driver_auth.dart';
import 'package:rentcarmobile/views/loginRegister/register_driver_car.dart';
import 'package:rentcarmobile/views/loginRegister/register_driver_docs.dart';
import 'package:rentcarmobile/views/loginRegister/register_driver_personal.dart';
import 'package:rentcarmobile/views/loginRegister/register_driver_skills.dart';
import 'package:rentcarmobile/views/mainPage/driver_main.dart';
import 'package:rentcarmobile/views/mainPage/customer_main.dart';
import 'package:rentcarmobile/views/profile/customer_profile.dart';
import 'package:rentcarmobile/views/profile/driver_profile.dart';
import 'package:rentcarmobile/views/profile/driver_profile_car.dart';
import 'package:rentcarmobile/views/profile/editProfilePages/edit_customer.dart';
import 'package:rentcarmobile/views/profile/editProfilePages/edit_driver_auth.dart';
import 'package:rentcarmobile/views/profile/editProfilePages/edit_driver_car.dart';
import 'package:rentcarmobile/views/profile/editProfilePages/edit_driver_docs.dart';
import 'package:rentcarmobile/views/profile/editProfilePages/edit_driver_personal.dart';
import 'package:rentcarmobile/views/profile/editProfilePages/edit_driver_skills.dart';
import 'package:rentcarmobile/views/profile/review_screen.dart';


void main() {
  runApp(const RentVanApp());
}

class RentVanApp extends StatelessWidget {
  const RentVanApp({super.key});

  static var userType = "customer";
  static var userId = "null";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rent Van App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 40, 40, 40),
        fontFamily: 'Arapey',
        primaryColor: const Color.fromARGB(255, 40, 40, 40),
        colorScheme: const ColorScheme(
          background: Color.fromARGB(255, 40, 40, 40),
          brightness: Brightness.light,
          error: Colors.red,
          onBackground: Color.fromARGB(255, 40, 40, 40),
          onError: Colors.red,
          onPrimary: Color.fromARGB(255, 244, 243, 243),
          onSecondary: Color.fromARGB(255, 167, 117, 77),
          onSurface: Color.fromARGB(255, 0, 0, 0),
          primary: Color.fromARGB(255, 167, 117, 77),
          secondary: Color.fromARGB(255, 167, 117, 77),
          surface: Color.fromARGB(255, 0, 0, 0),
        ),
        highlightColor: const Color.fromARGB(255, 167, 117, 77),
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
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 16,
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
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/forgotPassword': (context) => ForgotPasswordScreen(),
        '/registerCustomer': (context) => RegisterCustomerScreen(),
        '/registerDriverAuth': (context) => RegisterDriverAuthScreen(),
        '/registerDriverPersonal': (context) => RegisterDriverPersonalScreen(),
        '/registerDriverSkills': (context) => RegisterDriverSkillsScreen(),
        '/registerDriverCar': (context) => RegisterDriverCarScreen(),
        '/registerDriverDocs': (context) => RegisterDriverDocsScreen(),
        '/driverMain': (context) => DriverMainScreen(),
        '/customerMain': (context) => CustomerMainScreen(),
        '/profileDriverPersonal' : (context) =>  DriverProfileScreen(),
        '/profileDriverCar' : (context) =>  DriverProfileCarScreen(),
        '/profileCustomer' : (context) => CustomerProfileScreen(),
        '/editCustomer' : (context) => EditCustomerScreen(),
        '/editDriverAuth': (context) =>  EditDriverAuthScreen(),
        '/editDriverPersonal': (context) =>  EditDriverPersonalScreen(),
        '/editDriverSkills': (context) => EditDriverSkillsScreen(),
        '/editDriverCar': (context) => EditDriverCarScreen(),
        '/editDriverDocs': (context) => EditDriverDocsScreen(),
        '/allChats': (context) => ChatScreen(),
        '/messaging' : (context) => MessageScreen(),
        '/reviewScreen' : (context) => ReviewScreen(),
      },
    );
  }
}
