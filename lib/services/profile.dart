import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rentcarmobile/models/review.dart';
import '../models/driver.dart';
import 'package:rentcarmobile/models/customer.dart';

class ProfileService {
  static Future<Driver> getDriver(String id) async {
    return Driver();
  }

  static Future<Customer> getCustomer(String id) async {
      final headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      };
      try {
        var url = Uri.parse("http://192.168.10.6:3000/api/info?ID=$id");
        var response = await http.get(url);
        Map<String, dynamic> map = jsonDecode(response.body);
          Customer temp = Customer();
          temp.name = map['name'];
          temp.surname = map['surname'];
          temp.password = map['password'];
          temp.mail = map['email'];
          temp.birthday = map['birthday'];
          temp.gender = map['gender'];
          temp.phoneNumber = map['phoneNumber'];
          temp.passportNumber = map['passportNumber'];
          temp.nationalId = map['nationalId'];
          return temp;
        } catch (e) {
          // Error!!!
          return Customer();
        }
   }

  static Future<int> editCustomer(Customer customer, String id) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse("http://192.168.10.6:3000/api/edit/customer");
      var response = await http.post(url,
          body: json.encode(
            {
              "_id": id,
              "NewName": customer.name,
              "NewPassword": customer.password,
              "NewphoneNumber": customer.phoneNumber,
              "NewEmail": customer.mail,
              "NewSurname": customer.surname,
              "NewBirthDate": customer.birthday,
              "NewGender": customer.gender,
              "NewNationalId": customer.nationalId,
              "NewPassportNumber": customer.passportNumber,
            },
          ),
          headers: headers);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }

}

  // static Future<int> editDriver(Driver driver) async {
  //   return 400;
  // }
  //

  //
  // static Future<int> reviewDriver(Review review) async {
  //   return 400;
  // }

