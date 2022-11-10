// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      id: json['id'] as String? ?? "0",
      driverId: json['driverId'] as String? ?? "null",
      customerId: json['customerId'] as String? ?? "null",
      location: json['location'] as String? ?? "null",
      hourlyPrice: json['hourlyPrice'] as int? ?? 0,
      totalHour: (json['totalHour'] as num?)?.toDouble() ?? 0,
      startDate: json['startDate'] as String? ?? "01-01-1900",
      endDate: json['endDate'] as String? ?? "01-01-1900",
      tripDescription: json['tripDescription'] as String? ?? "null",
      reviewId: json['reviewId'] as String? ?? "null",
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'id': instance.id,
      'driverId': instance.driverId,
      'customerId': instance.customerId,
      'location': instance.location,
      'hourlyPrice': instance.hourlyPrice,
      'totalHour': instance.totalHour,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'tripDescription': instance.tripDescription,
      'reviewId': instance.reviewId,
    };
