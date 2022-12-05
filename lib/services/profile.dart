import 'dart:convert';
import 'package:http/http.dart' as http;
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
      var url = Uri.parse("http://192.168.10.5:3000/api/info?ID=" + id);
      var response = await http.get(url);
      Customer customer = Customer.fromJson(jsonDecode(response.body));

      return customer;
      //return Customer.m(map['name'], map['surname'], map['password'], map['mail'], map['birthday'], map['gender'], map['phoneNumber'], map['passportNumber'], map['nationalId']);
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
      var url = Uri.parse("http://192.168.1.104:3000/api/info")
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
}



/* static Future<int> editDriver(Driver driver) async {
    return 400;
  }

  static Future<int> editCustomer(Customer customer) async {
    return 400;
  }

  static Future<int> reviewDriver(Review review) async {
    return 400;
  }

  */

