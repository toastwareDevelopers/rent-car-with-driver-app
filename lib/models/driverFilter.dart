import 'package:json_annotation/json_annotation.dart';
part  'driverFilter.g.dart';

@JsonSerializable()
class DriverFilter {
  String? location;
  String? gender;
  String? language;
  int? hourlyPriceStart;
  int? hourlyPriceEnd;
  double? ratingStart;
  double? ratingEnd;
  double? ageStart;
  double? ageEnd;
  double? carYearStart;
  double? carYearEnd;
  DriverFilter( {
    this.location = "null",
    this.gender = "null",
    this.language = "null",
    this.hourlyPriceStart= 0,
    this.hourlyPriceEnd= 5000,
    this.ratingStart = 0.0,
    this.ratingEnd = 10.0,
    this.ageStart = 18,
    this.ageEnd = 70,
    this.carYearStart = 1990,
    this.carYearEnd = 2022,
  });


  factory DriverFilter.fromJson(Map<String, dynamic> json) => _$DriverFilterFromJson(json);

  Map<String, dynamic> toJson() => _$DriverFilterToJson(this);
}