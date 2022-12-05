import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rentcarmobile/models/review.dart';
import 'package:rentcarmobile/services/profile.dart';

import '../../models/customer.dart';
import '../../widgets/customer_trip_widget.dart';
import '../../widgets/review_widget_2.dart';

class CustomerProfileScreen extends StatefulWidget {
  const CustomerProfileScreen({super.key});

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  List<CustomerTrip> trips = [
    new CustomerTrip("Burak Yasar", 35, "Samsun", "12-0-1", "15-0-20"),
    new CustomerTrip("Harun Albayrak", 45, "Istanbul", "12-0-1", "15-0-20"),
    new CustomerTrip("Eray Yasar", 32, "Karabuk", "12-0-1", "15-0-20"),
    new CustomerTrip("Taha Yasar", 40, "Istanbul", "12-0-1", "15-0-20"),
    new CustomerTrip("Alperen Acıkgoz", 50, "Eskisehir", "12-0-1", "15-0-20"),
    new CustomerTrip("Berkan Akin", 50, "Manisa", "12-0-1", "15-0-20")
  ];
  static const IconData pencil = IconData(0xf1d7, fontFamily: 'MaterialIcons');

  List<ReviewWidget2> reviews = [
    new ReviewWidget2(
        "Levis Hemilton", "Virajlara hızlı girmesi haricinde iyi bir sofor"),
    new ReviewWidget2(
        "Levis Hemilton", "Virajlara hızlı girmesi haricinde iyi bir sofor"),
  ];
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    int i = 0;
    int count = 2;
    Customer tmp;

    //Map<String, dynamic> map =  ProfileService.getCustomer("636802ba08ae9ae84b4b7eda") as Map<String, dynamic> ;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    color: const Color.fromARGB(255, 167, 117, 77),
                    onPressed: () {
                      debugPrint("Butona tıklandı");
                    },
                    iconSize: 24,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: phoneWidth * 0.05),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                          'lib/assets/images/blank-profile-photo.png'),
                      radius: 30,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Austin Exel (37)",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Istanbul Male",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    // en dıstaki
                    width: phoneWidth,

                    child: Column(
                      children: [
                        Container(
                            height: phoneHeight * 0.05,
                            width: phoneWidth,
                            padding: EdgeInsets.only(left: phoneWidth * 0.05),
                            alignment: Alignment.centerLeft,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                textAlign: TextAlign.left,
                                "Trip History",
                                style: TextStyle(color: Colors.white),
                              ),
                            )), // triphistroy
                        Container(
                          height: phoneHeight * 0.4,
                          width: phoneWidth * 0.9,
                          padding: EdgeInsets.only(
                            left: phoneWidth * 0.02,
                            right: phoneWidth * 0.02,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: ListView(
                            children: trips,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: phoneHeight * 0.05,
                        width: phoneWidth,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: phoneWidth * 0.05),
                        child: const Text(
                          textAlign: TextAlign.left,
                          "Reviews",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        height: phoneHeight * 0.25,
                        width: phoneWidth * 0.9,
                        padding: EdgeInsets.only(left: phoneWidth * 0.01),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListView(
                          children: reviews,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width: phoneWidth,
                      height: phoneHeight * 0.15,
                      padding: EdgeInsets.only(
                          top: phoneHeight * 0.02, right: phoneWidth * 0.03),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(10),
                            backgroundColor: const Color.fromARGB(
                                255, 167, 117, 77), // <-- Button color
                            foregroundColor: Colors.red, // <-- Splash color
                          ),
                          child: const Icon(pencil, color: Colors.white),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
