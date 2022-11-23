import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/driver.dart';
import 'package:rentcarmobile/models/customer.dart';
import 'package:flutter/cupertino.dart';
import '../models/login.dart';

class AuthService {
  static Future<int> controlEmailPhone(String email, String phoneNumber) async {
    final driverCheckBody = {
      "email": email,
      "phoneNumber": phoneNumber,
    };
    final driverCheckHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };

    try {
      var url = Uri.parse("http://localhost:3000/api/signup/driverCheck");
      var response = await http.post(url,
          body: json.encode(driverCheckBody), headers: driverCheckHeaders);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }

  static Future<int> registerDriver(Driver driver) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      // var url = Uri.parse("http://192.168.1.105:3000/api/signup/driver");
      var url = Uri.parse("http://localhost:3000/api/signup/driver");
      var response = await http.post(url,
          body: json.encode(driver.toJson()), headers: headers);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }

  static Future<int> registerCustomer(Customer data) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      //var url = Uri.parse("http://192.168.1.105:3000/api/signup/customer");
      var url = Uri.parse("http://localhost:3000/api/signup/customer");
      var response = await http.post(url,
          body: json.encode(
            {
              "name": data.name,
              "surname": data.surname,
              "email": data.mail,
              "password": data.password,
              "passportNumber": data.passportNumber,
              "gender": data.gender,
              "phoneNumber": data.phoneNumber,
              "birthDate": data.birthday,
              "nationalId": data.nationalId
            },
          ),
          headers: headers);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }

  static Future<Response> login(Login login) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      //var url = Uri.parse("http://192.168.1.105:3000/api/signin");
      var url = Uri.parse("http://localhost:3000/api/signin");
      var response = await http.post(url,
          body: json.encode(login.toJson()), headers: headers);
      debugPrint(response.body.toString());
      return response;
    } catch (e) {
      return Response("null", 400);
    }
  }
}
