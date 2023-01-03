// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activeRentingDriver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveRentingDriver _$ActiveRentingDriverFromJson(Map<String, dynamic> json) {
  return ActiveRentingDriver(
    id: json['id'] as String?,
    driverId: json['driverId'] as String?,
    customerId: json['customerId'] as String?,
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    location: json['location'] as String?,
    price: json['price'] as int?,
    customerName: json['customerName'] as String?,
    customerSurname: json['customerSurname'] as String?,
    customerProfileImage: json['profile_image64'] as String?,
    customerBirthDate: json['birthDate'] as String?,
  );
}

Map<String, dynamic> _$ActiveRentingDriverToJson(
        ActiveRentingDriver instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driverId': instance.driverId,
      'customerId': instance.customerId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'location': instance.location,
      'price': instance.price,
      'customerName': instance.customerName,
      'customerSurname': instance.customerSurname,
      'profile_image64': instance.customerProfileImage,
      'birthDate': instance.customerBirthDate,
    };
