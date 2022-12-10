import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentcarmobile/models/trip.dart';
import '../constants/api_path.dart';
import '../models/driver.dart';
import 'package:rentcarmobile/models/customer.dart';

import '../models/review.dart';

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

  static Future<List<Review>> getCustomerReviews(String id) async {
    try {
      var url = Uri.parse("http://3.75.233.211:3000/api/info?ID=" + id);
      var response = await http.get(url);
      List<Review> review = jsonDecode(response.body);
      return review;
    } catch (e) {
      List<Review> review2 = [];
      return review2;
    }
  }

  static Future<List<Trip>> getTripsById(String id) async {
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
      print("yyyyy");
      var response = await http.get(url, headers: headers);
      var jsonData = json.decode(response.body);
      print("json ${response.body}");
      List<Trip> listTrip = [];
      print("xxxxx");

      for (var u in jsonData) {
        print("aaaaaa");
        Trip trip = Trip();
        trip.sId = u["_id"];
        print("ccccccc");
        trip.customerName = u["customerName"];
        print("dddddd");
        trip.startDate = u["startDate"];
        print("eeeeeee");
        trip.endDate = u["endDate"];
        print("fffffff");
        trip.location = u["location"];
        print("ggggg");

        trip.price = u["price"];
        print("bbbbbb");
        listTrip.add(trip);
        print("kkkkk");
      }
      print("lenght ${listTrip.length}");
      return listTrip;
    } catch (e) {
      List<Trip> listTrip2 = [];
      print("buradamisin");
      return listTrip2;
    }
  }

  static Future<int> editDriver(Driver driver, String id) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/api/edit/driver");
      var response = await http.post(url,
          body: json.encode({
            "role": "driver",
            "phoneNumber": driver.phoneNumber,
            "email": driver.email,
            driver.password.toString().isEmpty ? "" : "NewPassword":
                driver.password,
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
            "carInfo": driver.carInfo,
            "hourlyPrice": driver.hourlyPrice,
            "taxNumber": driver.taxNumber,
            "trips": driver.trips,
            "_id": id,
            "__v": 0 // what is this?
          }),
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
              customer.password.toString().isEmpty ? "" : "NewPassword":
                  customer.password,
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
