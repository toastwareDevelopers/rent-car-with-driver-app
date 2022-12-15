// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return Driver(
    email: json['email'] as String?,
    password: json['password'] as String?,
    name: json['name'] as String?,
    surname: json['surname'] as String?,
    birthDate: json['birthDate'] as String?,
    gender: json['gender'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    nationalId: json['nationalId'] as String?,
    passportNumber: json['passportNumber'] as String?,
    location: json['location'] as String?,
    info: json['info'] as String?,
    skills: (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    languages:
        (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
    licenceNumber: json['licenceNumber'] as String?,
    licenceYear: json['licenceYear'] as String?,
    rating: (json['rating'] as num).toDouble(),
    hourlyPrice: json['hourlyPrice'] as int?,
    taxNumber: json['taxNumber'] as String?,
    carInfo: json['carInfo'] as Map<String, dynamic>?,
    trips: (json['trips'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'surname': instance.surname,
      'birthDate': instance.birthDate,
      'gender': instance.gender,
      'phoneNumber': instance.phoneNumber,
      'nationalId': instance.nationalId,
      'passportNumber': instance.passportNumber,
      'location': instance.location,
      'info': instance.info,
      'skills': instance.skills,
      'languages': instance.languages,
      'licenceNumber': instance.licenceNumber,
      'licenceYear': instance.licenceYear,
      'rating': instance.rating,
      'hourlyPrice': instance.hourlyPrice,
      'taxNumber': instance.taxNumber,
      'carInfo': instance.carInfo,
      'trips': instance.trips,
    };
