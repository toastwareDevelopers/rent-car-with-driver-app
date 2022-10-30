import 'package:json_annotation/json_annotation.dart';
part  'customer.g.dart';




@JsonSerializable()
class CustomerRegisterData {
  String? name;
  String? surname;
  String? mail;
  String? password;
  String? phoneNumber;
  int? idtype;
  String? idNumber;
  String? birthday;
  String? gender;

  CustomerRegisterData( {
    this.mail = "null",
    this.password = "null",
    this.name = "null",
    this.surname = "null",
    this.birthday = "null",
    this.gender = "null",
    this.phoneNumber = "null",
    this.idNumber = "null",
    this.idtype =0,
  });


  factory CustomerRegisterData.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);




}