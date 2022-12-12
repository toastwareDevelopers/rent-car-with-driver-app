import 'package:json_annotation/json_annotation.dart';
part 'offer.g.dart';

@JsonSerializable()
class Offer {
  String? id;
  String? driverId;
  String? customerId;
  String? location;
  int? price;
  String? startDate;
  String? endDate;
  String? offerDescription;
  String? status;

  Offer(
      {this.id = "0",
      this.driverId = "null",
      this.customerId = "null",
      this.location = "null",
      this.price = 0,
      this.startDate = "01-01-1900",
      this.endDate = "01-01-1900",
      this.offerDescription = "null",
      this.status = "Waiting"
  });

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  Map<String, dynamic> toJson() => _$OfferToJson(this);
}
