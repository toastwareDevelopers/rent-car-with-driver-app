import 'package:json_annotation/json_annotation.dart';
part 'login.g.dart';

@JsonSerializable()
class Login{
  String email = "null";
  String password = "null";

  Login({
    this.email = "null",
    this.password = "null",
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);

  @override
  String toString() {
    return "email : $email\npassword : $password\n";
  }
}