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
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/api/info?ID=" + id);
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

  /*static Future<List<Trip>> getCustomerTrips(List<String> tripsId ) async {
      List<Trip> trips = [];


      for (int i = 1; i < tripsId.length; i++) {
        trips.add(ProfileService.getTripsById(tripsId[i]));
      }
      return trips;
    }
  */

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
                "role": "driver",
                "phoneNumber": driver.phoneNumber,
                "email": driver.email,
                driver.password.toString().isEmpty ? "" : "NewPassword": driver.password,
                "name": driver.name,
                "surname": driver.surname,
                "birthDate": driver.birthDate,
                "gender": driver.gender,
                "nationalId": driver.nationalId,
                "location": driver.location,
                "skills": driver.skills,
                "languages": driver.languages,
                "licenseNumber": driver.licenceNumber,
                "licenseYear": driver.licenceYear,
                "carInfo" : driver.carInfo,
                "hourlyPrice": driver.hourlyPrice,
                "taxNumber" : driver.taxNumber,
                "trips": driver.trips,
                "_id": id,
                "__v": 0 // what is this?
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
              "NewName": customer.name,
              customer.password.toString().isEmpty ? "" : "NewPassword": customer.password,
              "NewphoneNumber": customer.phoneNumber,
              "NewEmail": customer.email,
              "NewSurname": customer.surname,
              "NewBirthDate": customer.birthDate,
              "NewGender": customer.gender,
              "NewNationalId": customer.nationalId,
              "NewPassportNumber": customer.passportNumber,
            },
          ),
          headers: headers);
      return response.statusCode;
    } catch (e) {
      return 400;
    }
  }

  //
  // static Future<int> reviewDriver(Review review) async {
  //   return 400;
  // }
}
  
  

