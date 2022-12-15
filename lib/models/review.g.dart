// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return Review(
    id: json['_id'] as String?,
    driverId: json['driverId'] as String?,
    customerId: json['customerId'] as String?,
    reviewText: json['reviewText'] as String?,
    rating: json['rating'] as double?,
    tripId: json['tripId'] as String?,
    customerName: json['customerName'] as String?,
    customerSurname: json['customerSurname'] as String?,
    driverName: json['driverName'] as String?,
    driverSurname: json['driverSurname'] as String?,
    driverProfilePhoto: json['driverProfile_image64'] as String?,
    customerProfilePhoto: json['customerProfile_image64'] as String?,
    createDate: json['createDate'] as String?,
  );
}

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      '_id': instance.id,
      'driverId': instance.driverId,
      'customerId': instance.customerId,
      'reviewText': instance.reviewText,
      'rating': instance.rating,
      'tripId': instance.tripId,
      'customerName': instance.customerName,
      'customerSurname': instance.customerSurname,
      'driverName': instance.driverName,
      'driverSurname': instance.driverSurname,
      'driverProfile_image64': instance.driverProfilePhoto,
      'customerProfile_image64': instance.customerProfilePhoto,
      'createDate': instance.createDate,
    };
