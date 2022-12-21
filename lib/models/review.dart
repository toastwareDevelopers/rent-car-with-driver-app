import 'package:json_annotation/json_annotation.dart';
part  'review.g.dart';

@JsonSerializable()
class Review {
  String? id;
  String? driverId;
  String? customerId;
  String? driverName;
  String? customerName;
  String? reviewText;
  double? rating;
  String? tripId;
  String? customerSurname;
  String? driverSurname;
  String? driverProfilePhoto;
  String? customerProfilePhoto;
  String? createDate;
  Review( {
    this.id = "0",
    this.driverId = "null",
    this.customerId = "null",
    this.reviewText = "null",
    this.rating = 0.0,
    this.tripId = "null",
    this.customerName = "null",
    this.customerSurname = "null",
    this.createDate = "2022-01-01",
    this. driverName = "null",
    this. driverSurname = "null",
    this. driverProfilePhoto = "null",
    this. customerProfilePhoto = "null"
  });


  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}