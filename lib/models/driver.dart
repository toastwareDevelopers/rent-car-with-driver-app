import 'package:json_annotation/json_annotation.dart';
part 'driver.g.dart';

@JsonSerializable()
class Driver {
  String id;
  String email;
  String password;
  String name;
  String surname;
  String birthDate;
  String gender;
  String phoneNumber;
  String nationalId;
  String passportNumber;
  String location;
  String bio;
  List<String> skills;
  List<String> languages;
  String licenseNumber;
  String licenseYear;
  double rating;
  int hourlyPrice;
  String taxNumber;
  Map<String, dynamic> carInfo;
  List<String> trips;
  String profileImage;
  List<String> reviews;
  List<String> carPhotos;
  List<String> legalDocumentPhotos;
  int balance;
  bool isActive;

  Driver({
    this.id = "null",
    this.email = "null",
    this.password = "null",
    this.name = "null",
    this.surname = "null",
    this.birthDate = "1900-01-01",
    this.gender = "Male",
    this.phoneNumber = "5000000000",
    this.nationalId = "null",
    this.passportNumber = "null",
    this.location = "null",
    this.bio = "null",
    this.skills = const [],
    this.languages = const [],
    this.licenseNumber = "null",
    this.licenseYear = "1900",
    this.rating = 0,
    this.hourlyPrice = 0,
    this.taxNumber = "null",
    this.carInfo = const {},
    this.trips = const [],
    this.profileImage = "null",
    this.reviews = const[],
    this.balance = 0,
    this.isActive = false,
    this.carPhotos = const["null"],
    this.legalDocumentPhotos = const["null"],
  });

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);

  @override
  String toString() {
    return "email : $email\npassword : $password\nname : $name\nsurname : $surname\nbirthDate : $birthDate\ngender : $gender\nphoneNumber : $phoneNumber\nnationalId : $nationalId\npassportNumber : $passportNumber\nlocation : $location\ninfo : $bio\nskills : $skills\nlanguages : $languages\nlicenceNumber : $licenseNumber\nlicenceYear : $licenseYear\nrating : $rating\nhourlyPrice : $hourlyPrice\ntaxNumber : $taxNumber\ncarInfo : $carInfo\ntrips : $trips\nreviews : $reviews";
  }
}
