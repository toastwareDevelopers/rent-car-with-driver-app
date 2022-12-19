// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activeRentingCustomer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveRentingCustomer _$ActiveRentingCustomerFromJson(
    Map<String, dynamic> json) {
  return ActiveRentingCustomer(
    id: json['id'] as String?,
    driverId: json['driverId'] as String?,
    customerId: json['customerId'] as String?,
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    location: json['location'] as String?,
    price: json['price'] as int?,
    driverName: json['driverName'] as String?,
    driverSurname: json['driverSurname'] as String?,
    driverProfileImage: json['profile_image64'] as String?,
  );
}

Map<String, dynamic> _$ActiveRentingCustomerToJson(
        ActiveRentingCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'driverId': instance.driverId,
      'customerId': instance.customerId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'location': instance.location,
      'price': instance.price,
      'driverName': instance.driverName,
      'driverSurname': instance.driverSurname,
      'profile_image64': instance.driverProfileImage,
    };
