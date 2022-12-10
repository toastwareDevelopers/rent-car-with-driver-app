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
  String? rating;
  String? tripId;
  Review( {
    this.id = "0",
    this.driverId = "null",
    this.customerId = "null",
    this.reviewText = "null",
    this.rating = "null",
    this.tripId = "null"
  });


  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}