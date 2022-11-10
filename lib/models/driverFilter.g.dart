// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driverFilter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverFilter _$DriverFilterFromJson(Map<String, dynamic> json) => DriverFilter(
      location: json['location'] as String? ?? "null",
      gender: json['gender'] as String? ?? "null",
      language: json['language'] as String? ?? "null",
      hourlyPriceStart: json['hourlyPriceStart'] as int? ?? 0,
      hourlyPriceEnd: json['hourlyPriceEnd'] as int? ?? 1000,
      ratingStart: (json['ratingStart'] as num?)?.toDouble() ?? 0.0,
      ratingEnd: (json['ratingEnd'] as num?)?.toDouble() ?? 10.0,
      ageStart: (json['ageStart'] as num?)?.toDouble() ?? 18,
      ageEnd: (json['ageEnd'] as num?)?.toDouble() ?? 100,
      carYearStart: (json['carYearStart'] as num?)?.toDouble() ?? 1900,
      carYearEnd: (json['carYearEnd'] as num?)?.toDouble() ?? 2022,
    );

Map<String, dynamic> _$DriverFilterToJson(DriverFilter instance) =>
    <String, dynamic>{
      'location': instance.location,
      'gender': instance.gender,
      'language': instance.language,
      'hourlyPriceStart': instance.hourlyPriceStart,
      'hourlyPriceEnd': instance.hourlyPriceEnd,
      'ratingStart': instance.ratingStart,
      'ratingEnd': instance.ratingEnd,
      'ageStart': instance.ageStart,
      'ageEnd': instance.ageEnd,
      'carYearStart': instance.carYearStart,
      'carYearEnd': instance.carYearEnd,
    };
