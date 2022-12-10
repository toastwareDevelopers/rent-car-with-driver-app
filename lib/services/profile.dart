import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rentcarmobile/models/review.dart';
import 'package:rentcarmobile/models/trip.dart';
import '../models/driver.dart';
import 'package:rentcarmobile/models/customer.dart';
import 'mains.dart';

class ProfileService {
  static Future<Driver> getDriver(String id) async {
    return Driver();
  }

  static Future<Customer> getCustomer(String id) async {
    Map<String, dynamic> map;
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse("http://3.75.233.211:3000/api/info?ID=" + id);
      var response = await http.get(url);
      Customer customer = Customer.fromJson(jsonDecode(response.body));

      return customer;
      //return Customer.m(map['name'], map['surname'], map['password'], map['mail'], map['birthday'], map['gender'], map['phoneNumber'], map['passportNumber'], map['nationalId']);
    } catch (e) {
      return Customer();
    }
  }
  static Future<List<Review>> getCustomerReviews(String id) async {

      try{

        var url = Uri.parse("http://3.75.233.211:3000/api/info?ID=" + id);
        var response = await http.get(url);
        List<Review> review  = jsonDecode(response.body);
        return review;
      }
      catch(e){
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
      var url = Uri.parse("http://192.168.10.6:3000/api/getTrips?")
          .replace(queryParameters: {
        'ID': id,
      });
      print("yyyyy");
      var response = await http.get(url, headers: headers);
      var jsonData = json.decode(response.body);
      print("json ${response.body}");
      List<Trip> listTrip = [];
      print("xxxxx");

      for(var u in jsonData){

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
      List<Trip> listTrip2 =[];
      print("buradamisin");
      return listTrip2;
    }
  }

  /*
  static Future<int> editDriver(Driver driver) async {
    return 400;
  }*/
    

  static Future<int> editCustomer(Customer customer, String id) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var url = Uri.parse("http://3.75.233.211:3000/api/edit/customer");
      var response = await http.post(url,
          body: json.encode(
            {
              "_id": id,
              "NewName": customer.name,
              "NewPassword": customer.password,
              "NewphoneNumber": customer.phoneNumber,
              "NewEmail": customer.mail,
              "NewSurname": customer.surname,
              "NewBirthDate": customer.birthday,
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

  static Future<int> reviewDriver(Review review) async {
    return 400;
  }

  // static Future<int> editDriver(Driver driver) async {
  //   return 400;
  // }
  //

  //
  // static Future<int> reviewDriver(Review review) async {
  //   return 400;
  // }

}
  
  

