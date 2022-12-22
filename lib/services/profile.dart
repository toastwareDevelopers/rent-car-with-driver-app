import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentcarmobile/models/trip.dart';
import '../constants/api_path.dart';
import '../models/driver.dart';
import 'package:rentcarmobile/models/customer.dart';

class ProfileService {
  static Future<Driver> getDriver(String id) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/api/info?ID=$id");
      var response = await http.get(url, headers: headers);
      Driver driver = Driver.fromJson(jsonDecode(response.body));
      return driver;
    } catch (e) {
      return Driver();
    }
  }

  static Future<Customer> getCustomer(String id) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/api/info?ID=$id");
      var response = await http.get(url, headers: headers);
      Customer customer = Customer.fromJson(jsonDecode(response.body));
      return customer;
    } catch (e) {
      return Customer();
    }
  }

  static Future<Trip> getTripsById(String id) async {
    final headers = {
      'Content-type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'Accept': 'application/json',
    };
    try {
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/api/info")
          .replace(queryParameters: {
        'ID': id,
      });

      var response = await http.get(url, headers: headers);

      Trip trip = jsonDecode(response.body);

      return trip;
    } catch (e) {
      return Trip();
    }
  }

  static Future<int> editDriver(Driver driver, String id) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse("http://"+ ApiPaths.serverIP + "/api/edit/driver");
      var response = await http.post(url,
          body: json.encode(
              {
                // "phoneNumber": driver.phoneNumber, cant be changed
                // "email": driver.email, cant be changed
                driver.password.toString().isEmpty ? "" : "password": driver.password,
                driver.name.toString().isEmpty ? "" : "name": driver.name,
                driver.surname.toString().isEmpty ? "" : "surname": driver.surname,
                driver.birthDate.toString().isEmpty ? "" : "birthDate": driver.birthDate,
                "gender": driver.gender,
                driver.info.toString().isEmpty ? "" : "info": driver.info,
                driver.nationalId.toString().isEmpty ? "" : "nationalId": driver.nationalId,
                driver.location.toString().isEmpty ? "" : "location": driver.location,
                driver.skills.toString().isEmpty ? "" : "skills": driver.skills,
                driver.languages.toString().isEmpty ? "" : "languages": driver.languages,
                driver.licenseNumber.toString().isEmpty ? "" : "licenseNumber": driver.licenseNumber,
                driver.licenseYear.toString().isEmpty ? "" : "licenseYear": driver.licenseYear,
                driver.carInfo.isEmpty ? "" : "carInfo" : driver.carInfo,
                driver.hourlyPrice.toString().isEmpty ? "" : "hourlyPrice": driver.hourlyPrice,
                driver.taxNumber.toString().isEmpty ? "" : "taxNumber" : driver.taxNumber,
                "_id": id,
                "profile_image64" : driver.profileImage,
              }
          ),
          headers: headers);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }

  static Future<int> editCustomer(Customer customer, String id) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/api/edit/customer");
      var response = await http.post(url,
          body: json.encode(
            {
              "_id": id,
              customer.name.toString().isEmpty ? "" : "NewName": customer.name,
              customer.password.toString().isEmpty ? "" : "NewPassword": customer.password,
              //"NewphoneNumber": customer.phoneNumber, cant be changed!
              //"NewEmail": customer.email, cant be changed!
              customer.surname.toString().isEmpty ? "" : "NewSurname": customer.surname,
              customer.birthDate.toString().isEmpty ? "" : "NewBirthDate": customer.birthDate,
              "NewGender": customer.gender,
              customer.nationalId.toString().isEmpty ? "" : "NewNationalId": customer.nationalId,
              customer.passportNumber.toString().isEmpty ? "" : "NewPassportNumber": customer.passportNumber,
              "NewProfile_image64" : customer.profileImage,
            },
          ),
          headers: headers);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }
}
  
  

