import 'package:http/http.dart' as http;

class AuthService {
  static void login() async {
    final body = {
      "phoneNumber":"5442231827",
      "email":"eray3@hotmail.com",
      "password":"sfdsdf"
    };

    try{
      var url = Uri.parse("http://localhost:3000/api/signup/driverCheck");
      var response = await http.post(url,body: body);
      print(response.body);
      print(response.statusCode);

    } catch (e){

    }
  }
}