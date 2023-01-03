import 'package:json_annotation/json_annotation.dart';
part 'activeRentingDriver.g.dart';

@JsonSerializable()
class ActiveRentingDriver {
  String? id;
  String? driverId;
  String? customerId;
  String? startDate;
  String? endDate;
  String? location;
  int? price;
  String? customerName;
  String? customerSurname;
  String? customerProfileImage;
  int? customerAge;
  String? customerBirthDate;

  ActiveRentingDriver({
    this.id = "null",
    this.driverId = "null",
    this.customerId = "null",
    this.startDate = "null",
    this.endDate = "null",
    this.location = "null",
    this.price = 0,
    this.customerName = "null",
    this.customerSurname = "null",
    this.customerProfileImage = "null",
    this.customerAge = 0,
    this.customerBirthDate = "null",
  });

  factory ActiveRentingDriver.fromJson(Map<String, dynamic> json) =>
      _$ActiveRentingDriverFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveRentingDriverToJson(this);
}
