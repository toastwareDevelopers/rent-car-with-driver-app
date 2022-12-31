import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/models/trip.dart';
import 'package:rentcarmobile/services/mains.dart';
import 'dart:math' as math;
import 'package:rentcarmobile/services/profile.dart';
import 'package:rentcarmobile/utils/base64_converter.dart';

import '../../constants/assets_path.dart';
import '../../models/driver.dart';

class DriverMainScreen extends StatefulWidget {
  DriverMainScreen({super.key});

  List<Trip> trips = [];
  List<String> tripListString = [];

  @override
  State<DriverMainScreen> createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          FutureBuilder(
            future: ProfileService.getDriver(RentVanApp.userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                String driverPhoto = (snapshot.data as Driver).profileImage;
                return InkWell(
                  onTap: () {
                    // THIS PART MIGHT HAVE AN ISSUE!!!
                    Navigator.pushNamed(context, '/profileDriverPersonal',
                        arguments: RentVanApp.userId);
                    //Navigator.of(context, rootNavigator: true).pushNamed("/profileDriverPersonal", arguments: RentVanApp.userId);
                  },
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).highlightColor,
                    radius: 24,
                    child: CircleAvatar(
                      backgroundImage: driverPhoto == "null"
                          ? AssetImage(AssetPaths.blankProfilePhotoPath)
                          : Image.memory(
                                  Base64Converter.decodeImage64(driverPhoto))
                              .image,
                      radius: 21.0,
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
        title: const Text(
          "Rent Car App",
          style: TextStyle(fontFamily: "Arapey", fontSize: 25),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, "/");
            RentVanApp.userId = "null";
          },
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Icon(
              Icons.exit_to_app,
              size: 30,
            ),
          ),
        ),
      ),
      floatingActionButton: InkWell(
        child: FloatingActionButton(
          backgroundColor: const Color(0xffA7754D),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              AssetPaths.chatIconPath,
              scale: 0.5,
              height: 40,
              width: 40,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/allChats");
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: phoneWidth * 0.05,
            right: phoneWidth * 0.05,
            bottom: phoneWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Active Customer",
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Arapey', fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: phoneHeight * 0.003,
            ),
            Expanded(
              flex: 2,
              child: Container(
                  child:
                      getActiveCustomerInfo(context, phoneWidth, phoneHeight)),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Future Appointments",
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Arapey', fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: phoneHeight * 0.003,
            ),
            Expanded(
              flex: 13,
              child: Container(
                child: listTrips(phoneWidth, phoneHeight),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container listTrips(double phoneWidth, double phoneHeight) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 5,
          color: const Color(0xffA7754D),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      height: phoneHeight * 0.7,
      width: phoneWidth * 0.9,
      child: FutureBuilder(
        future: MainService.getFutureTrips(
            widget.tripListString, RentVanApp.userId),
        builder: (contextv2, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                  horizontal: phoneWidth * 0.02, vertical: phoneHeight * 0.01),
              separatorBuilder: (context, index) => SizedBox(
                height: phoneHeight * 0.01,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (contextv2, index) => snapshot
                          .data?[index].customerId !=
                      "null"
                  ? Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).highlightColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      padding: EdgeInsets.all(5),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  "/profileCustomer",
                                  arguments: snapshot.data?[index].customerId,
                                );
                              },
                              child: ListTile(
                                style: ListTileStyle.list,
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30,
                                        child: CircleAvatar(
                                          backgroundImage: snapshot.data?[index]
                                                      .customerProfileImage ==
                                                  "null"
                                              ? AssetImage(AssetPaths
                                                  .blankProfilePhotoPath)
                                              : Image.memory(base64Decode(snapshot
                                                          .data?[index]
                                                          .customerProfileImage
                                                      as String))
                                                  .image,
                                          radius: 27.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: phoneWidth * 0.05,
                                      height: phoneHeight * 0.05,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${snapshot.data?[index].customerName} ${snapshot.data?[index].customerSurname} (${snapshot.data?[index].customerAge})",
                                          style: const TextStyle(
                                              fontFamily: "Arapey",
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "${snapshot.data?[index].location}",
                                          style: const TextStyle(
                                              fontFamily: "Arapey",
                                              color: Colors.white,
                                              fontSize: 14),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Start: ${snapshot.data?[index].startDate?.substring(0, 10)}",
                                              style: const TextStyle(
                                                  fontFamily: "Arapey",
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              width: phoneWidth * 0.02,
                                            ),
                                            Text(
                                              "Finish: ${snapshot.data?[index].endDate?.substring(0, 10)}",
                                              style: const TextStyle(
                                                  fontFamily: "Arapey",
                                                  color: Colors.white,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            height: phoneHeight * 0.03,
                            width: phoneWidth * 0.15,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                            ),
                            child: Center(
                              child: Text(
                                "${snapshot.data?[index].price} TL",
                                style: const TextStyle(fontFamily: "Arapey"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
            );
          } else if (snapshot.hasError) {
            throw Error();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget getActiveCustomerInfo(
      BuildContext context, double phoneWidth, double phoneHeight) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: FutureBuilder(
        future: MainService.getDriverActiveTrip(
            widget.tripListString, RentVanApp.userId),
        builder: (contextv2, snapshot) {
          if (snapshot.data != null && snapshot.data?.customerId != "null") {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(alignment: Alignment.topRight, children: [
                Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/profileCustomer",
                        arguments: snapshot.data?.customerId,
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: phoneHeight * 0.01),
                      child: ListTile(
                        style: ListTileStyle.list,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                                child: CircleAvatar(
                                  backgroundImage: snapshot
                                              .data?.customerProfileImage ==
                                          "null"
                                      ? AssetImage(
                                          AssetPaths.blankProfilePhotoPath)
                                      : Image.memory(base64Decode(snapshot
                                                  .data?.customerProfileImage
                                              as String))
                                          .image,
                                  radius: 27.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: phoneWidth * 0.05,
                              height: phoneHeight * 0.05,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data?.customerName} ${snapshot.data?.customerSurname} (${snapshot.data?.customerAge})",
                                  style: const TextStyle(
                                      fontFamily: "Arapey",
                                      color: Colors.white,
                                      fontSize: 17),
                                ),
                                Text(
                                  "${snapshot.data?.location}",
                                  style: const TextStyle(
                                      fontFamily: "Arapey",
                                      color: Colors.white,
                                      fontSize: 14),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Start: ${snapshot.data?.startDate?.substring(0, 10)}",
                                      style: const TextStyle(
                                          fontFamily: "Arapey",
                                          color: Colors.white,
                                          fontSize: 14),
                                    ),
                                    SizedBox(
                                      width: phoneWidth * 0.02,
                                    ),
                                    Text(
                                      "Finish: ${snapshot.data?.endDate?.substring(0, 10)}",
                                      style: const TextStyle(
                                          fontFamily: "Arapey",
                                          color: Colors.white,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  height: phoneHeight * 0.03,
                  width: phoneWidth * 0.15,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                  child: Center(
                    child: Text(
                      "${snapshot.data?.price} TL",
                      style: const TextStyle(fontFamily: "Arapey"),
                    ),
                  ),
                ),
              ]);
            } else if (snapshot.hasError) {
              throw Error();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          } else {
            return Container(
              padding: EdgeInsets.all(17),
              child: Center(
                child: Text(
                  snapshot.connectionState == ConnectionState.done
                      ? "No active customer"
                      : "Active customer is loading...",
                  style: TextStyle(fontFamily: "Arapey", color: Colors.white),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}