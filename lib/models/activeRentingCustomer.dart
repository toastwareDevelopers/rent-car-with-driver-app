import 'package:json_annotation/json_annotation.dart';
part 'activeRentingCustomer.g.dart';

@JsonSerializable()
class ActiveRentingCustomer {
  String? id;
  String? driverId;
  String? customerId;
  String? startDate;
  String? endDate;
  String? location;
  int? price;
  String? driverName;
  String? driverSurname;
  String? driverProfileImage;

  ActiveRentingCustomer({
    this.id = "null",
    this.driverId = "null",
    this.customerId = "null",
    this.startDate = "null",
    this.endDate = "null",
    this.location = "null",
    this.price = 0,
    this.driverName = "null",
    this.driverSurname = "null",
    this.driverProfileImage = "null",
  });

  factory ActiveRentingCustomer.fromJson(Map<String, dynamic> json) =>
      _$ActiveRentingCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveRentingCustomerToJson(this);
}