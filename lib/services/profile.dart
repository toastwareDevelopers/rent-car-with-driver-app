import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentcarmobile/models/review.dart';
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

  static Future<List<Review>> getReviewsById(String userId) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse(
          "http://" + ApiPaths.serverIP + "/api/getReviews?ID=$userId");
      var response = await http.get(url, headers: headers);
      List<dynamic> reviewsD = jsonDecode(response.body);

      List<Review> reviews = [];

      reviewsD.forEach((e) {
        var reviewMap = Map<String, dynamic>.from(e);
        Review review = Review(
            id: reviewMap["_id"],
            driverId: reviewMap["driverId"],
            customerId: reviewMap["customerId"],
            rating: (reviewMap["rating"] as int).toDouble(),
            reviewText: reviewMap["reviewText"],
            tripId: reviewMap["tripId"],
            customerName: reviewMap["customerName"],
            customerSurname: reviewMap["customerSurname"],
            createDate: reviewMap["createDate"],
            driverName: reviewMap["driverName"],
            driverSurname: reviewMap["driverSurname"],
            customerProfilePhoto: reviewMap["customerProfile_image64"],
            driverProfilePhoto: reviewMap["driverProfile_image64"]);
        reviews.add(review);
      });

      return reviews;
    } catch (e) {
      return [];
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
            // "phoneNumber": driver.phoneNumber, cant be changed
            // "email": driver.email, cant be changed
            driver.password.toString().isEmpty ? "" : "NewPassword":
                driver.password,
            driver.name.toString().isEmpty ? "" : "name": driver.name,
            driver.surname.toString().isEmpty ? "" : "surname": driver.surname,
            driver.birthDate.toString().isEmpty ? "" : "birthDate":
                driver.birthDate,
            "gender": driver.gender,
            driver.nationalId.toString().isEmpty ? "" : "nationalId":
                driver.nationalId,
            driver.location.toString().isEmpty ? "" : "location":
                driver.location,
            driver.skills.toString().isEmpty ? "" : "skills": driver.skills,
            driver.languages.toString().isEmpty ? "" : "languages":
                driver.languages,
            driver.licenceNumber.toString().isEmpty ? "" : "licenseNumber":
                driver.licenceNumber,
            driver.licenceYear.toString().isEmpty ? "" : "licenseYear":
                driver.licenceYear,
            driver.carInfo.toString().isEmpty ? "" : "carInfo": driver.carInfo,
            driver.hourlyPrice.toString().isEmpty ? "" : "hourlyPrice":
                driver.hourlyPrice,
            driver.taxNumber.toString().isEmpty ? "" : "taxNumber":
                driver.taxNumber,
            //"trips": driver.trips, why is this here?
            "_id": id,
            "profile_image64": driver.profileImage,
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
              customer.name.toString().isEmpty ? "" : "NewName": customer.name,
              customer.password.toString().isEmpty ? "" : "NewPassword":
                  customer.password,
              //"NewphoneNumber": customer.phoneNumber, cant be changed!
              //"NewEmail": customer.email, cant be changed!
              customer.surname.toString().isEmpty ? "" : "NewSurname":
                  customer.surname,
              customer.birthDate.toString().isEmpty ? "" : "NewBirthDate":
                  customer.birthDate,
              "NewGender": customer.gender,
              customer.nationalId.toString().isEmpty ? "" : "NewNationalId":
                  customer.nationalId,
              customer.passportNumber.toString().isEmpty
                  ? ""
                  : "NewPassportNumber": customer.passportNumber,
              "NewProfile_image64": customer.profileImage,
              // need to add part for profile image!
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