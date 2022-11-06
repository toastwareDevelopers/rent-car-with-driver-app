part of 'customer.dart';

CustomerRegisterData _$CustomerFromJson(Map<String, dynamic> json) => CustomerRegisterData(
  mail: json['mail'] as String? ?? "null",
  password: json['password'] as String? ?? "null",
  name: json['name'] as String? ?? "null",
  surname: json['surname'] as String? ?? "null",
  birthday: json['birthDate'] as String? ?? "null",
  gender: json['gender'] as String? ?? "null",
  phoneNumber: json['phoneNumber'] as String? ?? "null",
  passportNumber: json['passportNumber'] as String? ?? "null",
  nationalId: json['nationalId'] as String? ?? "null",
);

Map<String, dynamic> _$CustomerToJson(CustomerRegisterData instance) => <String, dynamic>{
  'email': instance.mail,
  'password': instance.password,
  'name': instance.name,
  'surname': instance.surname,
  'birthDate': instance.birthday,
  'gender': instance.gender,
  'phoneNumber': instance.phoneNumber,
  'nationalId': instance.nationalId,
  'passportNumber':instance.passportNumber,



};