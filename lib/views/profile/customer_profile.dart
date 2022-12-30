import 'package:flutter/material.dart';
import 'package:rentcarmobile/models/CustomerAllData.dart';
import 'package:rentcarmobile/models/review.dart';
import 'package:rentcarmobile/services/profile.dart';
import 'package:rentcarmobile/utils/base64_converter.dart';
import 'package:rentcarmobile/views/chat/message_screen.dart';

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
      appBar: AppBar(
        elevation: 0,
      ),
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
                return customerTrips(customerData!, customerID);
              }
          }
        },
      ),
    );
  }

  @override
  Widget customerTrips(CustomerData customerData, String customerID) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    int i = 0;
    customerListTrips.clear();
    if (customerData.listTrips.isNotEmpty == true) {
      for (i = 0; i < customerData.listTrips.length; i++) {
        customerListTrips.add(
          CustomerTrip(
            customerId: RentVanApp.userId,
            driverId: customerData.listTrips[i].driverId.toString(),
            age: customerData.listTrips[i].age,
            city: customerData.listTrips[i].location.toString(),
            driverName: customerData.listTrips[i].driverName.toString(),
            driverSurname: customerData.listTrips[i].driverSurname.toString(),
            finish_time: customerData.listTrips[i].endDate.toString(),
            start_time: customerData.listTrips[i].startDate.toString(),
            tripId: customerData.listTrips[i].id.toString(),
            reviewId: customerData.listTrips[i].reviewId.toString(),
            driverProfileImage:
                customerData.listTrips[i].driverProfileImage.toString(),
          ),
        );
      }
    }

    if (customerData.listReview.isNotEmpty == true) {
      customerListReview.clear();
      for (i = 0; i < customerData.listReview.length; i++) {
        customerListReview.add(
          ReviewWidget2(
            "${customerData.listReview[i].driverName} ${customerData.listReview[i].driverSurname}",
            customerData.listReview[i].reviewText.toString(),customerData.listReview[i].driverProfilePhoto.toString(),customerData.listReview[i].rating.toString()
          ),
        );
      }
    }

    String nameAge =
        '${customerData.customer.name} ${customerData.customer.surname} (${DateTime.now().year - DateTime.parse(customerData.customer.birthDate.toString()).year})';

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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MessageScreen(
                      receiverId: customerID,
                    ),
                  ),
                );
                //Navigator.pushNamed(context, "/messaging");
              },
      ),
      body: Column(
        children: [
          //Profile Photo and Name
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(right: 5),
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).highlightColor,
                            radius: 40,
                            child: CircleAvatar(
                              backgroundImage: customerData
                                              .customer.profileImage !=
                                          null &&
                                      customerData.customer.profileImage !=
                                          "null"
                                  ? Image.memory(Base64Converter.decodeImage64(
                                          customerData.customer.profileImage
                                              as String))
                                      .image
                                  : AssetImage(
                                      AssetPaths.blankProfilePhotoPath),
                              radius: 37.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameAge,
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                          Text(
                            "${customerData.customer.gender}",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: phoneHeight * 0.01,
          ),
          //Trip History
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.03),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          textAlign: TextAlign.left,
                          "Trip History",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: phoneWidth * 0.02,
                        right: phoneWidth * 0.02,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: ListView.separated(
                        itemCount: customerListTrips.length,
                        itemBuilder: (context, index) =>
                            customerListTrips[index],
                        separatorBuilder: (context, index) => SizedBox(
                          height: phoneHeight * 0.01,
                        ),
                        padding: EdgeInsets.only(top: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: phoneHeight * 0.03,
          ),
          //Reviews
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.only(
                  left: phoneWidth * 0.03,
                  right: phoneWidth * 0.03,
                  bottom: phoneWidth * 0.02),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        textAlign: TextAlign.left,
                        "Reviews",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListView.separated(
                        itemCount: customerListReview.length,
                        itemBuilder: (context, index) {
                          return customerListReview[index];
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: phoneHeight * 0.01,
                          );
                        },
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
