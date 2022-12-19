import 'package:json_annotation/json_annotation.dart';
part  'review.g.dart';

@JsonSerializable()
class Review {
  String? id;
  String? driverId;
  String? customerId;
  String? driverName;
  String? driverSurname;
  String? customerName;
  String? customerSurname;
  String? reviewText;
  String? rating;
  String? tripId;
  String? driverProfile_image64;

  Review( {
    this.id = "0",
    this.driverId = "null",
    this.customerId = "null",
    this.driverName = "null",
    this.customerName = "null",
    this.driverSurname = "null",
    this.customerSurname = "null",
    this.reviewText = "null",
    this.rating = "null",
    this.tripId = "null",
    this.driverProfile_image64,
  });


  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}