import 'package:flutter/material.dart';
import 'package:rentcarmobile/models/CustomerAllData.dart';
import 'package:rentcarmobile/models/review.dart';
import 'package:rentcarmobile/services/profile.dart';
import 'package:rentcarmobile/utils/base64_converter.dart';

import '../../constants/assets_path.dart';
import '../../main.dart';
import '../../models/customer.dart';
import '../../models/trip.dart';
import '../../widgets/customer_trip_widget.dart';
import '../../widgets/review_widget_2.dart';

class CustomerProfileScreen extends StatefulWidget {
  CustomerProfileScreen({super.key});

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  List<CustomerTrip> customerListTrips = [];
  List<ReviewWidget2> customerListReview = [];

  Future<CustomerData> getData(String customerID) async {
    var customer = Customer();
    List<Trip> trip = [];
    List<Review> review = [];
    await Future.wait([
      ProfileService.getTripsById(customerID).then((value) => trip = value),
    ]);

    await Future.wait([
      ProfileService.getCustomer(customerID).then((value) => customer = value),
    ]);
    await Future.wait([
      ProfileService.getCustomerReviews(customerID)
          .then((value) => review = value),
    ]);
    final customerData = CustomerData(customer, trip, review);
    return customerData;
  }

  @override
  Widget build(BuildContext context) {
    String customerID = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: FutureBuilder<CustomerData>(
        future: getData(customerID),
        builder: (context, snapshot) {
          CustomerData? customerData = snapshot.data;

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return const Center(child: Text('Some error occurred!'));
              } else {
                return customerTrips(customerData!);
              }
          }
        },
      ),
    );
  }

  @override
  Widget customerTrips(CustomerData customerData) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    int i = 0;
    customerListTrips.clear();
    if (customerData.listTrips.isNotEmpty == true) {
      for (i = 0; i < customerData.listTrips.length; i++) {
        customerListTrips.add(CustomerTrip(
            '${customerData.listTrips[i].driverName.toString()} ${customerData.listTrips[i].driverSurname.toString()}',
            customerData.listTrips[i].age.toString(),
            customerData.listTrips[i].location.toString(),
            customerData.listTrips[i].startDate.toString(),
            customerData.listTrips[i].endDate.toString(),
            customerData.listTrips[i].id.toString(),
            customerData.listTrips[i].customerId.toString(),
            customerData.listTrips[i].driverId.toString()));
      }
    }

    if (customerData.listReview.isNotEmpty == true) {
      customerListReview.clear();
      for (i = 0; i < customerData.listReview.length; i++) {
        customerListReview.add(ReviewWidget2(
            "${customerData.listReview[i].driverName} ${customerData.listReview[i].driverSurname}",
            customerData.listReview[i].reviewText.toString()));
      }
    }
    //Map<String, dynamic> map =  ProfileService.getCustomer("636802ba08ae9ae84b4b7eda") as Map<String, dynamic> ;
    String nameAge =
        '${customerData.customer.name} ${customerData.customer.surname} (${2022 - DateTime.parse(customerData.customer.birthDate.toString()).year})';
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
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).highlightColor,
                      radius: 40,
                      child: CircleAvatar(
                        backgroundImage: customerData.customer.profileImage == null ?
                            AssetImage(AssetPaths.blankProfilePhotoPath) :
                            Image.memory(Base64Converter.decodeImage64(customerData.customer.profileImage as String)).image,
                        radius: 37,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          nameAge,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "${customerData.customer.gender}",
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
                            children: customerListTrips,
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
                          children: customerListReview,
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
