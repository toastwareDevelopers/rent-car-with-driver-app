import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentcarmobile/models/customerRegisterData.dart';

class AuthService {
  static Future<int> registerCustomer(CustomerRegisterData data) async {
    try {
      var url = Uri.parse("http://192.168.1.105:3000/api/signup/customer");
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
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
      );
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }
}
