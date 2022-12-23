import 'package:json_annotation/json_annotation.dart';
part 'trip.g.dart';

@JsonSerializable()
class Trip {
  String? id;
  String? driverId;
  String? customerId;
  String? customerName;
  String? customerSurname;
  int? customerAge;
  String? customerProfileImage;
  String? location;
  int? price;
  String? startDate;
  String? endDate;
  String? iV;
  String? driverName;
  String? driverSurname;
  String? tripDescription;
  String? reviewId;
  int age;

  Trip({
    this.id = "0",
    this.driverId = "null",
    this.customerId = "null",
    this.customerName = "null",
    this.customerSurname = "null",
    this.customerAge = 0,
    this.customerProfileImage = "null",
    this.location = "null",
    this.price = 0,
    this.startDate = "01-01-1900",
    this.endDate = "01-01-1900",
    this.tripDescription = "null",
    this.reviewId = "null",
    this.iV = "null",
    this.driverName = "null",
    this.driverSurname = "null",
    this.age = 0,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);
}
