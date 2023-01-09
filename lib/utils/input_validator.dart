import 'package:iban/iban.dart';

class InputValidator{
  static String validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return "";
    }
  }

  static String validatePhoneNumber(String? value) {
    String pattern =
        r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid phone number';
    } else {
      return "";
    }
  }

  static String validateIBAN(String? value) {
    if (!isValid(value!)) {
      return "Please enter a valid IBAN";
    }
    return "";
  }

  static String validateRating(String? value){
    if(double.parse(value.toString()) > 10){
        return "Rating can not be greater than 10";
    }
    return "";
  }

}
