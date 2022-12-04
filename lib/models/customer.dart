import 'package:json_annotation/json_annotation.dart';
part  'customer.g.dart';

@JsonSerializable()
class Customer {
  String? name;
  String? surname;
  String? mail;
  String? password;
  String? phoneNumber;
  String? passportNumber;
  String? birthday;
  String? gender;
  String? nationalId;
  Customer( {
    this.mail = "null",
    this.password = "null",
    this.name = "null",
    this.surname = "null",
    this.birthday = "null",
    this.gender = "null",
    this.phoneNumber = "null",
    this.passportNumber = "null",
    this.nationalId ="null",
  });
  // This will take customer info from their ID (Stub)
  Customer.n(int userID){
    mail = "johndoe@hotmail.com";
    password = "asdasd";
    name = "John";
    surname = "Doe";
    birthday = "1998";
    gender = "Male";
    phoneNumber = "05333333333";
    passportNumber = "2357";
    nationalId = "12345";
  }

  Customer.m(String name, String surname, String password, String mail, String birthday, String gender, String phoneNumber, String passportNumber, String nationalId){
    this.mail = mail;
    this.password = password;
    this.name = name;
    this.surname = surname;
    this.birthday = birthday;
    this.gender = gender;
    this.phoneNumber = phoneNumber;
    this.passportNumber = passportNumber;
    this.nationalId =nationalId;
  }

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);

}