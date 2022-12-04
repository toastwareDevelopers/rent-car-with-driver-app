import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:rentcarmobile/models/driverFilter.dart';
import 'package:rentcarmobile/models/trip.dart';
import 'package:rentcarmobile/models/customer.dart';

import '../models/driver.dart';

class MainService {
  static Future<Customer> getTripsCustomer(String id) async {
    final headers = {
      'Content-type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'Accept': 'application/json',
      'ID': id,
    };
    try {
      var url = Uri.parse("http://192.168.1.104:3000/api/info")
          .replace(queryParameters: {
        'ID': id,
      });

      var response = await http.get(url, headers: headers);
      Customer customer = Customer.fromJson(jsonDecode(response.body));
      return customer;
    } catch (e) {
      return Customer();
    }
  }

  static Future<Trip?> getDriverActiveTrip(List<String> tripListString) async {
    tripListString =
        (await MainService.getTripsByDriverId("635400487075dc541cc72e63"))!;

    if (tripListString.isNotEmpty) {
      return (await MainService.getTripById(tripListString[0]));
    }
    return null;
  }

  static Future<List<Trip>> getFutureTrips(List<String> tripListString) async {
    List<Trip> trips = [];
    tripListString =
        (await MainService.getTripsByDriverId("635400487075dc541cc72e63"))!;
    for (int i = 1; i < tripListString.length; i++) {
      trips.add((await MainService.getTripById(tripListString[i])));
    }
    return trips;
  }

  static Future<List<String>?> getTripsByDriverId(String id) async {
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
      var tagsJson = jsonDecode(response.body)['trips'];
      List<String>? tags = tagsJson != null ? List.from(tagsJson) : null;
      return tags;
    } catch (e) {
      return List.empty();
    }
  }

  static Future<Trip> getTripById(String id) async {
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
      var tripJson = jsonDecode(response.body);
      Trip trip = Trip.fromJson(tripJson);
      response = await http.get(url, headers: headers);
      Customer customer = await getTripsCustomer(trip.customerId!);
      trip.customerName = customer.name;
      return trip;
    } catch (e) {
      return Trip();
    }
  }

  static Future<Trip> getCustomerActiveTrip(String id) async {
    return Trip();
  }

  static Future<List<Driver>> getFilteredDrivers(
      DriverFilter driverFilter) async {
    return [];
  }
}
