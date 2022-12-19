// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['_id'] as String? ?? "0",
      driverId: json['driverId'] as String? ?? "null",
      customerId: json['customerId'] as String? ?? "null",
      reviewText: json['reviewText'] as String? ?? "null",
      rating: json['rating'] as String? ?? "null",
      tripId: json['tripId'] as String? ?? "null",
      customerName: json['customerName'] as String? ?? "null",
      customerSurname: json["customerSurname"] as String? ?? "null",
      driverName: json["driverName"] as String? ?? "null",
      driverSurname: json["driverSurname"] as String? ?? "null",
      driverProfile_image64: json["driverProfile_image64"] as String? ?? "null",
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      '_id': instance.id,
      'driverId': instance.driverId,
      'customerId': instance.customerId,
      'reviewText': instance.reviewText,
      'rating': instance.rating,
      'tripId': instance.tripId,
      'customerName' :instance.customerName,
      'customerSurname' : instance.customerSurname,
      'driverName' : instance.driverName,
      'driverSurname' : instance.driverSurname,
      'driverProfile_image64' : instance.driverProfile_image64,
    };
