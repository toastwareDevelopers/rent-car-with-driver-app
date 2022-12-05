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
  String info = "null";
  List<String> skills = [];
  List<String> languages = [];
  String licenceNumber = "null";
  String licenceYear = "1900";
  double rating = 0.0;
  int hourlyPrice = 0;
  String taxNumber = "null";
  Map<String, dynamic> carInfo = {};
  List<String> trips = [];

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
    this.info = "null",
    this.skills = const [],
    this.languages = const [],
    this.licenceNumber = "null",
    this.licenceYear = "null",
    this.rating = 0,
    this.hourlyPrice = 0,
    this.taxNumber = "null",
    this.carInfo = const {},
    this.trips = const [],
  });

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);

  @override
  String toString() {
    return "email : " +
        email +
        "\n" +
        "password : " +
        password +
        "\n" +
        "name : " +
        name +
        "\n" +
        "surname : " +
        surname +
        "\n" +
        "birthDate : " +
        birthDate +
        "\n" +
        "gender : " +
        gender +
        "\n" +
        "phoneNumber : " +
        phoneNumber +
        "\n" +
        "nationalId : " +
        nationalId +
        "\n" +
        "passportNumber : " +
        passportNumber +
        "\n" +
        "location : " +
        location +
        "\n" +
        "info : " +
        info +
        "\n" +
        "skills : " +
        skills.toString() +
        "\n" +
        "languages : " +
        languages.toString() +
        "\n" +
        "licenceNumber : " +
        licenceNumber +
        "\n" +
        "licenceYear : " +
        licenceYear +
        "\n" +
        "rating : " +
        rating.toString() +
        "\n" +
        "hourlyPrice : " +
        hourlyPrice.toString() +
        "\n" +
        "taxNumber : " +
        taxNumber +
        "\n" +
        "carInfo : " +
        carInfo.toString() +
        "\n" +
        "trips : " +
        trips.toString() +
        "\n";
  }
}