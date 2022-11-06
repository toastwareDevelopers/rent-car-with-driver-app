import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../models/login.dart';

class AuthService {
  static Future<Response> login(Login login) async {
    final driverCheckHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse(
          "http://192.168.1.105:3000/api/signin");
      var response = await http.post(url,
          body: json.encode(login.toJson()), headers: driverCheckHeaders);
      debugPrint(response.body.toString());
      return response;
    } catch (e) {
      return Response("null", 400);
    }
  }
}
