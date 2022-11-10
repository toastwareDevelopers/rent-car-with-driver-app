// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['id'] as String? ?? "0",
      driverId: json['driverId'] as String? ?? "null",
      customerId: json['customerId'] as String? ?? "null",
      reviewText: json['reviewText'] as String? ?? "null",
      rating: json['rating'] as String? ?? "null",
      tripId: json['tripId'] as String? ?? "null",
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'driverId': instance.driverId,
      'customerId': instance.customerId,
      'reviewText': instance.reviewText,
      'rating': instance.rating,
      'tripId': instance.tripId,
    };
