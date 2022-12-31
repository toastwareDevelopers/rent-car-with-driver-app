import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
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
              "Total : 300 TL",
              style: TextStyle(
                fontFamily: "Arapey",
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
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
