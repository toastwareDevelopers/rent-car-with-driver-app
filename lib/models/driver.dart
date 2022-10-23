import 'package:json_annotation/json_annotation.dart';
part 'driver.g.dart';

@JsonSerializable()
class Driver {
  String email = "null";
  String password = "null";
  String name = "null";
  String surname = "null";
  String birthDate = "1900-01-01";
  String gender = "Male";
  String phoneNumber = "5000000000";
  String nationalId = "null";
  String passportNumber = "null";
  String location = "null";
  String bio = "null";
  List<String> skills = [];
  List<String> languages = [];
  String licenceNumber = "null";
  String licenceYear = "1900";
  double rating = 0.0;
  int hourlyPrice = 0;
  String taxNumber = "null";
  Map<String, dynamic> carInfo = {};

  Driver({
    this.email = "null",
    this.password = "null",
    this.name = "null",
    this.surname = "null",
    this.birthDate = "null",
    this.gender = "null",
    this.phoneNumber = "null",
    this.nationalId = "null",
    this.passportNumber = "null",
    this.location = "null",
    this.bio = "null",
    this.skills = const [],
    this.languages = const [],
    this.licenceNumber = "null",
    this.licenceYear = "null",
    this.rating = 0,
    this.hourlyPrice = 0,
    this.taxNumber = "null",
    this.carInfo = const {},
  });

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}
