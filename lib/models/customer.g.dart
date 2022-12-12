// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    email: json['email'] as String?,
    password: json['password'] as String?,
    name: json['name'] as String?,
    surname: json['surname'] as String?,
    birthday: json['birthday'] as String?,
    birthDate: json['birthDate'] as String?,
    gender: json['gender'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    passportNumber: json['passportNumber'] as String?,
    nationalId: json['nationalId'] as String?,
  )..trips =
      (json['trips'] as List<dynamic>?)?.map((e) => e as String).toList();
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'passportNumber': instance.passportNumber,
      'birthday': instance.birthday,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'nationalId': instance.nationalId,
      'trips': instance.trips,
    };
