// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) {
  return Trip(
    id: json['id'] as String?,
    driverId: json['driverId'] as String?,
    customerId: json['customerId'] as String?,
    customerName: json['customerName'] as String?,
    customerSurname: json['customerSurname'] as String?,
    customerAge: json['customerAge'] as int?,
    location: json['location'] as String?,
    price: json['price'] as int?,
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    tripDescription: json['tripDescription'] as String?,
    reviewId: json['reviewId'] as String?,
  );
}

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'id': instance.id,
      'driverId': instance.driverId,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'customerSurname': instance.customerSurname,
      'customerAge': instance.customerAge,
      'location': instance.location,
      'price': instance.price,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'tripDescription': instance.tripDescription,
      'reviewId': instance.reviewId,
    };