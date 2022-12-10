import 'package:json_annotation/json_annotation.dart';
part 'customer.g.dart';

@JsonSerializable()
class Customer {
  String? name;
  String? surname;
  String? email;
  String? password;
  String? phoneNumber;
  String? passportNumber;
  String? birthday;
  String? birthDate;
  String? gender;
  String? nationalId;
  List<String>? trips;
  Customer( {
    this.email = "null",
    this.password = "null",
    this.name = "null",
    this.surname = "null",
    this.birthday = "null",
    this.birthDate = "null",
    this.gender = "null",
    this.phoneNumber = "null",
    this.passportNumber = "null",
    this.nationalId = "null",
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
