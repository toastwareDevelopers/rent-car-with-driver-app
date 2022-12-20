import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rentcarmobile/models/review.dart';
import 'package:rentcarmobile/services/profile.dart';

import '../../constants/assets_path.dart';
import '../../main.dart';
import '../../models/customer.dart';
import '../../models/trip.dart';
import '../../widgets/customer_trip_widget.dart';
import '../../widgets/review_widget_2.dart';

class CustomerProfileScreen extends StatefulWidget {
  const CustomerProfileScreen({super.key});

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  List<CustomerTrip> customerListTrips= [];
  static const IconData pencil = IconData(0xf1d7, fontFamily: 'MaterialIcons');

  List<ReviewWidget2> reviews = [
    new ReviewWidget2(
        "Levis Hemilton", "Virajlara hızlı girmesi haricinde iyi bir sofor"),
    new ReviewWidget2(
        "Levis Hemilton", "Virajlara hızlı girmesi haricinde iyi bir sofor"),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: FutureBuilder<List<Trip>>(
      future: ProfileService.getTripsById("63661b9f08ae9ae84b4b7e7d"),
      builder: (context, snapshot) {
        List<Trip>? listTrips = snapshot.data;
        switch(snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          default:
            if(snapshot.hasError) {
              return const Center(child: Text('Some error occurred!'));
            } else {

              return customerTrips(listTrips!);
            }
        }
      },
    ),
  );
  @override
  Widget customerTrips(List<Trip> listTrips){
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    int i = 0;
    int count = 2;
    Customer tmp;
    if(listTrips.isNotEmpty == true){
      for(i=0;i<listTrips.length;i++){
        customerListTrips.add(CustomerTrip(listTrips[i].customerName,
            listTrips[i].age ,listTrips[i].location,
            listTrips[i].startDate, listTrips[i].endDate));

      }

    }
    //Map<String, dynamic> map =  ProfileService.getCustomer("636802ba08ae9ae84b4b7eda") as Map<String, dynamic> ;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: RentVanApp.userType == "customer"
            ? Image.asset(
                AssetPaths.editIconPath,
                scale: 0.1,
                height: 40,
                width: 40,
                color: Colors.white,
              )
            : Image.asset(
                AssetPaths.chatIconPath,
                scale: 0.1,
                height: 40,
                width: 40,
                color: Colors.white,
              ),
        onPressed: RentVanApp.userType == "customer"
            ? () {
                Navigator.pushNamed(context, "/editCustomer");
              }
            : () {
                Navigator.pushNamed(context, "/messaging");
              },
      ),
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
                      Navigator.pop(context);
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            padding: EdgeInsets.only(top: 10),
                            children:   customerListTrips,
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
                          padding: EdgeInsets.only(top: 10),
                          children: reviews,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
