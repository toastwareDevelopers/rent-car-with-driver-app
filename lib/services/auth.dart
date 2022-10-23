import 'package:http/http.dart' as http;

import '../models/driver.dart';

class AuthService {
  static void login() async {
  }

  static Future<int> controlEmailPhone(Driver driver) async {
    try{
      var url = Uri.parse("http://localhost:3000/api/signup/driverCheck");
      var response = await http.post(url,body: driver.toJson());
      return response.statusCode;
    } catch (e){
      return 400;
    }
  }

  static Future<int> registerDriver(Driver driver) async {
    try{
      var url = Uri.parse("http://localhost:3000/api/signup/driver");
      var response = await http.post(url,body: driver.toJson());
      return response.statusCode;
    } catch (e){
      return 400;
    }
  }
}