import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentcarmobile/models/review.dart';
import '../models/driver.dart';
import 'package:rentcarmobile/models/customer.dart';

class ProfileService {
  static Future<Driver> getDriver(String id) async {
    return Driver();
  }

  static Future<Customer> getCustomer(String id) async {
    return Customer();
  }

  static Future<int> editDriver(Driver driver) async {
    return 400;
  }

  static Future<int> editCustomer(Customer customer) async {
    return 400;
  }

  static Future<int> reviewDriver(Review review) async {
    return 400;
  }
}
