import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/driver.dart';

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
      var url = Uri.parse("http://192.168.1.105:3000/api/signup/driverCheck");
      var response = await http.post(url,
          body: json.encode(driverCheckBody), headers: driverCheckHeaders);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }

  static Future<int> registerDriver(Driver driver) async {
    final driverCheckHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse("http://192.168.1.105:3000/api/signup/driver");
      var response = await http.post(url, body: json.encode(driver.toJson()),headers: driverCheckHeaders);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }
}
