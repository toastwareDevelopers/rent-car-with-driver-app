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
      var url = Uri.parse("http://192.168.10.5:3000/api/signup/customer");
      print("nerede1");
      var response = await http.post(url,
          body: json.encode(driverCheckBody), headers: driverCheckHeaders);
      print("nerede2");
      print("status:"+response.body.toString());
      print("statuscode:"+response.statusCode.toString());
      return response.statusCode;
    } catch (e) {
      print("auth:"+e.toString());
      return 400;
    }
  }
  static Future<int> registerCustomer(CustomerRegisterData data) async {

    try{



        try{
          var url = Uri.parse("http://192.168.10.5:3000/api/signup/customer");
          var response = await http.post(url,headers: {"Content-Type": "application/json"},
              body: json.encode({"name": data.name,"surname":data.surname, "email":data.mail, "password": data.password,
              "passportNumber":data.passportNumber,"gender": data.gender,"phoneNumber": data.phoneNumber,"birthDate": data.birthday,
                "nationalId":data.nationalId}) );
          print("burada akin");

          print("akin:"+response.body.toString());
          return response.statusCode;
        } catch (e){
          print("auth:"+e.toString());
          ;
        }


    } catch (e){
      print("auth:"+e.toString());
    }
    return 400;
  }
}