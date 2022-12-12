// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driverFilter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverFilter _$DriverFilterFromJson(Map<String, dynamic> json) {
  return DriverFilter(
    location: json['location'] as String?,
    gender: json['gender'] as String?,
    language: json['language'] as String?,
    hourlyPriceStart: json['hourlyPriceStart'] as int?,
    hourlyPriceEnd: json['hourlyPriceEnd'] as int?,
    ratingStart: (json['ratingStart'] as num?)?.toDouble(),
    ratingEnd: (json['ratingEnd'] as num?)?.toDouble(),
    ageStart: (json['ageStart'] as num?)?.toDouble(),
    ageEnd: (json['ageEnd'] as num?)?.toDouble(),
    carYearStart: (json['carYearStart'] as num?)?.toDouble(),
    carYearEnd: (json['carYearEnd'] as num?)?.toDouble(),
  );
}

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
