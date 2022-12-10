// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      sId : json['_id'] as String? ?? "null",
      driverId : json['driverId'] as String? ?? "null",
      customerId : json['customerId'] as String? ?? "null",
      startDate : json['startDate'] as String? ?? "null",
      endDate : json['endDate'] as String? ?? "null",
      location : json['location'] as String? ?? "null",
      price : json['price']  ?? 0,
      iV : json['__v'] as String? ?? "null",
      customerName : json['customerName'] as String? ?? "null",
      driverName : json['driverName']  as String? ?? "null",
);

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{

      '_id' : instance.sId,
      'driverId' : instance.driverId,
      'customerId' : instance.customerId,
      'startDate' : instance.startDate,
      'endDate': instance.endDate,
      'location' : instance.location,
      'price' : instance.price,
      '__v' : instance.iV,
      'customerName' : instance.customerName,
      'driverName' : instance.driverName,


};
