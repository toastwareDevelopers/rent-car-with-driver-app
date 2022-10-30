import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rentcarmobile/models/customerRegisterData.dart';

class AuthService {
  static void login() async {
    final body = {
      "phoneNumber":"5551234567",
      "email":"merhaba@xyz.com",
      "password":"sfdsdf"
    };

    try{
      var url = Uri.parse("http://localhost:3000/api/signup/driver");
      var response = await http.post(url,body: body);
      print(response.body);

    } catch (e){

    }


  }
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
      var url = Uri.parse("https://webhook.site/6382e02d-71ac-4d71-8fdd-4dd0cc903187");
      var response = await http.post(url,
          body: json.encode(driverCheckBody), headers: driverCheckHeaders);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }
  static Future<int> registerCustomer(CustomerRegisterData data) async {

    try{



        try{
          var url = Uri.parse("https://webhook.site/6382e02d-71ac-4d71-8fdd-4dd0cc903187");
          var response = await http.post(url,headers: {"Content-Type": "application/json"},
              body: json.encode({"name": data.name,"surname":data.surname, "email":data.mail, "password": data.password,
              "idnumber":data.idNumber,"gender": data.gender,"phoneNumber": data.phoneNumber,"birthday": data.birthday,
                "idtype":data.idtype}) );

          return response.statusCode;
        } catch (e){

          return 400;
        }


    } catch (e){
      print("hata:");
    }
    return 400;
  }
}