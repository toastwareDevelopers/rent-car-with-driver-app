import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/models/activeRentingCustomer.dart';
import 'package:rentcarmobile/models/driverFilter.dart';
import 'package:rentcarmobile/models/trip.dart';
import 'package:rentcarmobile/models/customer.dart';

import '../constants/api_path.dart';
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
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/api/info")
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

  static Future<Trip?> getDriverActiveTrip(
      List<String> tripListString, String driverID) async {
    tripListString = (await MainService.getTripsByDriverId(driverID))!;

    if (tripListString.isNotEmpty) {
      return (await MainService.getTripById(tripListString[0]));
    }
    return null;
  }

  static Future<List<Trip>> getFutureTrips(
      List<String> tripListString, String driverID) async {
    List<Trip> trips = [];
    tripListString = (await MainService.getTripsByDriverId(driverID))!;
    for (int i = 1; i < tripListString.length; i++) {
      trips.add((await MainService.getTripById(tripListString[i])));
    }
    return trips;
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
      print(response.body);
      var jsonData = json.decode(response.body);
      List<Trip> listTrip = [];

      for (var u in jsonData) {
        Trip trip = Trip();
        trip.customerName = u["customerName"];
        trip.customerSurname = u["customerSurname"];
        DateTime dt = DateTime.parse(u["customerBirthDate"]);
        trip.age = DateTime.now().year - dt.year;
        trip.customerAge = DateTime.now().year - dt.year;
        trip.startDate = u["startDate"];
        trip.endDate = u["endDate"];
        trip.location = u["location"];
        trip.price = u["price"];
        trip.customerId = u["customerId"];
        trip.driverId = u["driverId"];
        trip.customerProfileImage = u["customerProfile_image64"];
        print(trip);
        listTrip.add(trip);
      }
      return listTrip;
    } catch (e) {
      print("Error:" + e.toString());
      List<Trip> listTrip2 = [];
      return listTrip2;
    }
  }

  ///ooookkkk
  static Future<List<String>?> getTripsByDriverId(String id) async {
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
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/api/info")
          .replace(queryParameters: {
        'ID': id,
      });
      var response = await http.get(url, headers: headers);
      var tripJson = jsonDecode(response.body);
      Trip trip = Trip.fromJsonShort(tripJson);
      response = await http.get(url, headers: headers);
      Customer customer = await getTripsCustomer(trip.customerId!);
      DateTime dt = DateTime.parse(customer.birthDate!);
      trip.age = DateTime.now().year - dt.year;
      trip.customerName = customer.name;
      trip.customerSurname = customer.surname;
      trip.customerAge = DateTime.now().year - dt.year;
      trip.customerProfileImage = customer.profileImage;
      return trip;
    } catch (e) {
      print("Error$e");
      return Trip();
    }
  }

  static Future<ActiveRentingCustomer> getCustomerActiveTrip(String id) async {
    final headers = {
      'Content-type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
      'Accept': 'application/json',
    };

    try {
      var url =
          Uri.parse("http://" + ApiPaths.serverIP + "/customer/activeTrip")
              .replace(queryParameters: {
        'ID': id,
      });

      var response = await http.get(url, headers: headers);
      ActiveRentingCustomer renting =
          ActiveRentingCustomer.fromJson(jsonDecode(response.body));
      return renting;
    } catch (e) {
      print("Error!");
      return ActiveRentingCustomer();
    }
  }

  static Future<List<Driver>> getFilteredDrivers(
      DriverFilter driverFilter) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };

    try {
      var url = Uri.parse("http://" + ApiPaths.serverIP + "/customer/main");
      var response = await http.post(url,
          body: json.encode(driverFilter), headers: headers);
      List<dynamic> driversD = jsonDecode(response.body);
      List<Driver> drivers = [];

      for (int i = 0; i < driversD.length; i++) {
        Driver driver = Driver.fromJson(driversD[i]);
        drivers.add(driver);
      }

      return drivers;
    } catch (e) {
      print("Error : $e");
      return [];
    }
  }
}
