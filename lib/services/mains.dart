import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentcarmobile/models/driverFilter.dart';
import 'package:rentcarmobile/models/trip.dart';

import '../models/driver.dart';

class MainService {
  static Future<Trip> getDriverActiveTrip(String id) async {
    return Trip();
  }

  static Future<List<Trip>> getDriverFutureTrips(String id) async {
    return [];
  }

  static Future<Trip> getCustomerActiveTrip(String id) async {
    return Trip();
  }

  static Future<List<Driver>> getFilteredDrivers(DriverFilter driverFilter) async {
    return [];
  }
}
