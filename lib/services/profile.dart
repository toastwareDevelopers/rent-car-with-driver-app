import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentcarmobile/models/review.dart';
import '../models/driver.dart';
import 'package:rentcarmobile/models/customer.dart';

class ProfileService {
  Map<String, dynamic> map;
  static Future<Driver> getDriver(String id) async {
    return Driver();
  }

  static Future<Map> getCustomer(String id) async {
    Map<String, dynamic> map;
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse("http://192.168.10.5:3000/api/info?ID=" + id);
      var response = await http.get(url);
      map = jsonDecode(response.body);
      print(map['surname']);
      return map;
      //return Customer.m(map['name'], map['surname'], map['password'], map['mail'], map['birthday'], map['gender'], map['phoneNumber'], map['passportNumber'], map['nationalId']);
    } catch (e) {
      Map<String, dynamic> map ;

    }
  }
}

 /* static Future<int> editDriver(Driver driver) async {
    return 400;
  }

  static Future<int> editCustomer(Customer customer) async {
    return 400;
  }

  static Future<int> reviewDriver(Review review) async {
    return 400;
  }

  */

