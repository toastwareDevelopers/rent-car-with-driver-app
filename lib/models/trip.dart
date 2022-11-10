import 'package:json_annotation/json_annotation.dart';
part  'trip.g.dart';

@JsonSerializable()
class Trip {
  String? id;
  String? driverId;
  String? customerId;
  String? location;
  int? hourlyPrice;
  double? totalHour;
  String? startDate;
  String? endDate;
  String? tripDescription;
  String? reviewId;

  Trip( {
    this.id = "0",
    this.driverId = "null",
    this.customerId = "null",
    this.location = "null",
    this.hourlyPrice = 0,
    this.totalHour = 0,
    this.startDate = "01-01-1900",
    this.endDate = "01-01-1900",
    this.tripDescription = "null",
    this.reviewId = "null"
  });


  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);
}