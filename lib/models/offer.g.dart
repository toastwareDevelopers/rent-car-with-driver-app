// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offer _$OfferFromJson(Map<String, dynamic> json) {
  return Offer(
    id: json['id'] as String?,
    driverId: json['driverId'] as String?,
    customerId: json['customerId'] as String?,
    location: json['location'] as String?,
    price: json['price'] as int?,
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    offerDescription: json['offerDescription'] as String?,
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'id': instance.id,
      'driverId': instance.driverId,
      'customerId': instance.customerId,
      'location': instance.location,
      'price': instance.price,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'offerDescription': instance.offerDescription,
      'status': instance.status,
    };
