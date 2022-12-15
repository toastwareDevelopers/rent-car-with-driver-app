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
      'createDate': instance.createDate,
    };
