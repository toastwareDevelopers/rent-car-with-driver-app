import 'package:json_annotation/json_annotation.dart';
part 'trip.g.dart';
class Trip {
  String? sId;
  String? driverId;
  String? customerId;
  String? startDate;
  String? endDate;
  String? location;
  int? price;
  String? iV;
  String? customerName;
  String? customerSurname;
  String? driverName;
  String? driverSurname;
  int age;

  Trip(
      {this.sId ="null",
        this.driverId ="null",
        this.customerId ="null",
        this.startDate ="null",
        this.endDate ="null",
        this.location ="null",
        this.price = 0,
        this.iV= "null",
        this.customerName = "null",
        this.driverName = "null",
        this.customerSurname = "null",
        this.driverSurname ="null",
        this.age = 0,
      });

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);


}



