import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/models/activeRentingCustomer.dart';
import 'package:rentcarmobile/models/driverFilter.dart';
import 'package:rentcarmobile/models/oldMessageReceiver.dart';
import 'package:rentcarmobile/models/trip.dart';
import 'package:rentcarmobile/models/customer.dart';

import '../constants/api_path.dart';
import '../models/driver.dart';

class ChatService {
  static Future<List<OldMessageReceiver>> getMessageHistory(String id) async {
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      var url = Uri.parse(
          "http://" + ApiPaths.serverIP + "/api/getMessageHistory?ID=$id");
      var response = await http.get(url, headers: headers);
      print(response.body);
      List<dynamic> messagesDynamic = jsonDecode(response.body);
      List<OldMessageReceiver> messages = [];

      for (int i = 0; i < messagesDynamic.length; i++) {
        OldMessageReceiver msg =
            OldMessageReceiver.fromJson(messagesDynamic[i]);
        messages.add(msg);
      }

      return messages;
    } catch (e) {
      print("Error:" + e.toString());
      return [];
    }
  }
}
