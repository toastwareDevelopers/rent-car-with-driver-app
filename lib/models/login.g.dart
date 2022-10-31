part of 'login.dart';

Login _$LoginFromJson(Map<String, dynamic> json) => Login(
  email: json['email'] as String? ?? "null",
  password: json['password'] as String? ?? "null",
  );

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
  'email': instance.email,
  'password': instance.password,
  };