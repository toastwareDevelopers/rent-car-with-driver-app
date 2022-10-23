import 'package:http/http.dart' as http;
import 'package:rentcarmobile/models/CustumerRegisterData.dart';

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
  void registerCustomer(CustumerRegisterData data){
    try{
      var url = Uri.parse("http://localhost:3000/api/signup/driver");
      var response = await http.post(url,body: body);
      print(response.body);

    } catch (e){

    }
  }
}