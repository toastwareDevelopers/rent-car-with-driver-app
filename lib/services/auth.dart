import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rentcarmobile/constants/api_path.dart';
import '../models/driver.dart';
import 'package:rentcarmobile/models/customer.dart';
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
      var url =
          Uri.parse("http://" + ApiPaths.serverIP + "/api/signup/driverCheck");
      var response = await http.post(url,
          body: json.encode(driverCheckBody), headers: driverCheckHeaders);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }

  static Future<Response> registerDriver(Driver driver) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/api/signup/driver");
      var response = await http.post(url,
          body: json.encode(driver.toJson()), headers: headers);
      return response;
    } catch (e) {
      return Response("null", 400);
    }
  }

  static Future<Response> registerCustomer(Customer customer) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url =
          Uri.parse("http://" + ApiPaths.serverIP + "/api/signup/customer");
      var response = await http.post(url,
          body: json.encode(customer.toJson()), headers: headers);
      return response;
    } catch (e) {
      return Response("null", 400);
    }
  }

  static Future<Response> login(Login login) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/api/signin");
      var response = await http.post(url,
          body: json.encode(login.toJson()), headers: headers);
      return response;
    } catch (e) {
      return Response("null", 400);
    }
  }

  static Future<int> resetPassword(String email) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    final resetPasswordBody = {
      "email": email,
    };

    try{
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/api/passwordReset/mail");
      var response = await http.post(url,body: json.encode(resetPasswordBody), headers: headers);
      return response.statusCode;
    }catch(e){
      print(e.toString());
      return 500;
    }
  }
}
