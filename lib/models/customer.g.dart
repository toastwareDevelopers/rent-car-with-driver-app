// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      email: json['email'] as String? ?? "null",
      password: json['password'] as String? ?? "null",
      name: json['name'] as String? ?? "null",
      surname: json['surname'] as String? ?? "null",
      birthday: json['birthday'] as String? ?? "null",
      gender: json['gender'] as String? ?? "null",
      phoneNumber: json['phoneNumber'] as String? ?? "null",
      passportNumber: json['passportNumber'] as String? ?? "null",
      nationalId: json['nationalId'] as String? ?? "null",
      birthDate: json['birthDate'] as String? ?? "null",
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'passportNumber': instance.passportNumber,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'nationalId': instance.nationalId,
      'birthDate': instance.birthDate,
    };
