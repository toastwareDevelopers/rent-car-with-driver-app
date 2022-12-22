import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentcarmobile/models/review.dart';
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

  static Future<List<Review>> getCustomerReviews(String id) async {
    try {
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/api/getReviews?ID=" + id);
      var response = await http.get(url);
      print("istekten sonra");
      List<Review> reviewList = [];
      var jsonData = jsonDecode(response.body);

      for (var u in jsonData) {
        Review review = Review();
        review.id = u["_id"];
        review.customerId = u["customerId"];
        review.customerName = u["customerName"];
        review.customerSurname = u["customerSurname"];
        review.driverId = u["driverId"];
        review.driverName = u["driverName"];
        review.driverSurname = u["driverSurname"];
        review.reviewText = u["reviewText"];
        review.tripId = u["tripId"];
        review.driverProfilePhoto = u["driverProfile_image64"];
        review.rating = u["rating"];

        print("rw: ${review.reviewText}");
        reviewList.add(review);
      }
      print("cutomer revies");
      return reviewList;
    } catch (e) {
      List<Review> review2 = [];
      print("review error");
      return review2;
    }
  }
  static Future<int> postCustomerReview(String customerId,String driverId,String reviewText,String rating,String tripId) async {
    final headers = {
      'Content-type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'Accept': 'application/json',
    };
    try{
      var url = Uri.parse( "http://" +ApiPaths.serverIP + "api/createReview");
      Map<String,String> bodyReview = {"customerId": customerId,"driverId" : driverId, "reviewText": reviewText,
                                        "rating": rating, "tripId": tripId};
      var reviewBody = json.encode(bodyReview);

      var response = await http.post(url,headers: headers,
      body: reviewBody);
      return response.statusCode;
    }
    catch(e){
    return 400;
    }
  }
  static Future<List<Trip>> getTripsById(String id) async {
    final headers = {
      'Content-type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'Accept': 'application/json',
    };
    try {
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/api/getTrips")
          .replace(queryParameters: {
        'ID': id,
      });

      var response = await http.get(url, headers: headers);
      var jsonData = json.decode(response.body);
      List<Trip> listTrip = [];

      for (var u in jsonData) {
        Trip trip = Trip();
        trip.id = u["_id"];
        trip.customerName = u["customerName"];
        trip.startDate = u["startDate"];
        trip.endDate = u["endDate"];
        trip.location = u["location"];
        trip.price = u["price"];
        trip.customerId =u["customerId"];
        trip.driverId = u["driverId"];
        listTrip.add(trip);
      }
      return listTrip;
    } catch (e) {
      List<Trip> listTrip2 = [];
      return listTrip2;
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
      print("Error getReviewsById() : " + e.toString());
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
          body: json.encode(
              {
                // "phoneNumber": driver.phoneNumber, cant be changed
                // "email": driver.email, cant be changed
                driver.password.toString().isEmpty ? "" : "password": driver.password,
                driver.name.toString().isEmpty ? "" : "name": driver.name,
                driver.surname.toString().isEmpty ? "" : "surname": driver.surname,
                driver.birthDate.toString().isEmpty ? "" : "birthDate": driver.birthDate,
                "gender": driver.gender,
                driver.bio.toString().isEmpty ? "" : "bio": driver.bio,
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
              customer.password.toString().isEmpty ? "" : "NewPassword":
                  customer.password,
              //"NewphoneNumber": customer.phoneNumber, cant be changed!
              //"NewEmail": customer.email, cant be changed!
              customer.surname.toString().isEmpty ? "" : "NewSurname":
                  customer.surname,
              customer.birthDate.toString().isEmpty ? "" : "NewBirthDate":
                  customer.birthDate,
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
