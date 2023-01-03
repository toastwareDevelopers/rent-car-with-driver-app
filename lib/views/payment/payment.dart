import 'package:flutter/material.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/services/mains.dart';
import 'package:rentcarmobile/services/profile.dart';
import 'package:rentcarmobile/views/chat/message_screen.dart';
import 'package:rentcarmobile/widgets/offer_box_widget.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../models/customer.dart';
import '../../utils/warning_alert.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    OfferBox offer = arguments['offer'];

    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          title: const Text(
            "Payment",
            style: TextStyle(fontFamily: "Arapey", fontSize: 25),
          ),
          centerTitle: true,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: phoneWidth * 1,
            height: phoneHeight * 0.08,
            child: Padding(
              padding: EdgeInsets.only(
                  left: phoneWidth * 0.08,
                  right: phoneWidth * 0.09,
                  bottom: phoneHeight * 0.01),
              child: const TextField(
                decoration: InputDecoration(hintText: "Credit Card Number"),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: phoneWidth * 0.08, right: phoneWidth * 0.07),
                child: SizedBox(
                  width: phoneWidth * 0.37,
                  height: phoneHeight * 0.08,
                  child: const TextField(
                    decoration: InputDecoration(hintText: "CVV"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: phoneWidth * 0.03),
                child: SizedBox(
                  width: phoneWidth * 0.18,
                  height: phoneHeight * 0.08,
                  child: const TextField(
                    decoration: InputDecoration(hintText: "MM"),
                  ),
                ),
              ),
              SizedBox(
                width: phoneWidth * 0.18,
                height: phoneHeight * 0.08,
                child: const TextField(
                  decoration: InputDecoration(hintText: "YY"),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: phoneWidth * 0.08, bottom: phoneHeight * 0.025),
            child: Text(
              "Total : ${offer.price} TL",
              style: const TextStyle(
                fontFamily: "Arapey",
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                // ignore: use_build_context_synchronously
                showSuccessDialog(context);
                offer.socket!.emit(
                  "respondOffer",
                  {
                    "roomID": offer.driverId + RentVanApp.userId,
                    "status": "Accepted",
                    "offerId": offer.id,
                  },
                );
              },
              child: const Text("      Pay       "),
            ),
          ),
          SizedBox(
            height: phoneHeight * 0.2,
          ),
        ],
      ),
    );
  }
}

showSuccessDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Payment Successful',
          style: TextStyle(fontFamily: "Arapey"),
        ),
        content: const SingleChildScrollView(
          child: Text(
            "Have a good journey!",
            style: TextStyle(fontFamily: "Arapey"),
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
