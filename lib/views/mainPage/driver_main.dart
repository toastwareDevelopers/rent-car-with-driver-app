import 'package:flutter/material.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/models/trip.dart';
import 'package:rentcarmobile/services/mains.dart';

import '../../constants/assets_path.dart';

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
    double phoneHeight = MediaQuery.of(context).size.height - 60;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xff282828),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/profileDriverPersonal",arguments: RentVanApp.userId);
                },
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).highlightColor,
                  radius: 24,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage(AssetPaths.blankProfilePhotoPath),
                    radius: 21.0,
                  ),
                ),
              ),
            ],
            title: const Text(
              "Rent Car App",
              style: TextStyle(fontFamily: "Arapey", fontSize: 25),
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
        backgroundColor: const Color(0xff282828),
        body: SizedBox(
          width: phoneWidth,
          height: phoneHeight,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: phoneHeight * 0.06, bottom: phoneHeight * 0.01),
                width: phoneWidth * 0.91,
                child: const Text(
                  "Active Customer",
                  style: TextStyle(color: Colors.white, fontFamily: 'Arapey'),
                ),
              ),
              getActiveTrip(phoneWidth, phoneHeight),
              Container(
                margin: EdgeInsets.only(
                    top: phoneHeight * 0.03, bottom: phoneHeight * 0.01),
                width: phoneWidth * 0.9,
                child: const Text(
                  "Future Appointments",
                  style: TextStyle(color: Colors.white, fontFamily: 'Arapey'),
                ),
              ),
              listTrips(phoneWidth, phoneHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget getActiveTrip(double phoneWidth, double phoneHeight) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/profileCustomer");
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffA7754D),
          border: Border.all(
            width: 5,
            color: const Color(0xffA7754D),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        height: phoneHeight * 0.125,
        width: phoneWidth * 0.91,
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getActiveCustomerInfo(phoneWidth, phoneHeight),
            ],
          ),
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
        future: MainService.getFutureTrips(widget.tripListString),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(
                      top: phoneHeight * 0.02,
                      right: phoneWidth * 0.015,
                      left: phoneWidth * 0.015),
                  decoration: BoxDecoration(
                    color: const Color(0xffA7754D),
                    border: Border.all(
                      color: const Color(0xffA7754D),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  height: phoneHeight * 0.125,
                  width: phoneWidth * 1,
                  child: ListTile(
                    style: ListTileStyle.list,
                    title: FittedBox(
                      alignment: Alignment.center,
                      fit: BoxFit.fitHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "lib/assets/images/blank-profile-photo.png",
                              width: phoneHeight * .14,
                              height: phoneHeight * .14,
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.05,
                            height: phoneHeight * 0.05,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data?[index].customerName} ${snapshot.data?[index].customerSurname} (${snapshot.data?[index].customerAge})",
                                style: const TextStyle(
                                    fontFamily: "Arapey",
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                              Text(
                                "${snapshot.data?[index].location}",
                                style: const TextStyle(
                                    fontFamily: "Arapey",
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                              Text(
                                "Start: ${snapshot.data?[index].startDate?.substring(0, 10)}",
                                style: const TextStyle(
                                    fontFamily: "Arapey",
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                              Text(
                                "Finish: ${snapshot.data?[index].endDate?.substring(0, 10)}",
                                style: const TextStyle(
                                    fontFamily: "Arapey",
                                    color: Colors.white,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          /*Text(
                            "${snapshot.data?[index].customerName} (${snapshot.data?[index].customerAge}) \n"
                            "${snapshot.data?[index].location} \n"
                            "Start: ${snapshot.data?[index].startDate?.substring(0, 10)}\nFinish: ${snapshot.data?[index].endDate?.substring(0, 10)}",
                            style: const TextStyle(
                                fontFamily: "Arapey",
                                color: Colors.white,
                                fontSize: 17),
                          ),*/
                          SizedBox(
                            width: phoneWidth * 0.3,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: phoneHeight * 0.05,
                                width: phoneWidth * 0.25,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 2,
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: FittedBox(
                                  child: Text(
                                    "${snapshot.data?[index].price} TL",
                                    style:
                                        const TextStyle(fontFamily: "Arapey"),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: phoneHeight * 0.1,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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

  FutureBuilder getActiveCustomerInfo(double phoneWidth, double phoneHeight) {
    return FutureBuilder(
      future: MainService.getDriverActiveTrip(widget.tripListString),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              width: phoneWidth * 1,
              height: phoneHeight * 0.125,
              child: ListTile(
                style: ListTileStyle.list,
                title: FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.fitHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "lib/assets/images/blank-profile-photo.png",
                          width: phoneHeight * .15,
                          height: phoneHeight * .15,
                        ),
                      ),
                      SizedBox(
                        width: phoneWidth * 0.05,
                        height: phoneHeight * 0.05,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${snapshot.data?.customerName} ${snapshot.data?.customerSurname} (${snapshot.data?.customerAge})",
                            style: const TextStyle(
                                fontFamily: "Arapey",
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          Text(
                            "${snapshot.data?.location}",
                            style: const TextStyle(
                                fontFamily: "Arapey",
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          Text(
                            "Start: ${snapshot.data?.startDate?.substring(0, 10)}",
                            style: const TextStyle(
                                fontFamily: "Arapey",
                                color: Colors.white,
                                fontSize: 18),
                          ),
                          Text(
                            "Finish: ${snapshot.data?.endDate?.substring(0, 10)}",
                            style: const TextStyle(
                                fontFamily: "Arapey",
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      /*Text(
                            "${snapshot.data?[index].customerName} (${snapshot.data?[index].customerAge}) \n"
                            "${snapshot.data?[index].location} \n"
                            "Start: ${snapshot.data?[index].startDate?.substring(0, 10)}\nFinish: ${snapshot.data?[index].endDate?.substring(0, 10)}",
                            style: const TextStyle(
                                fontFamily: "Arapey",
                                color: Colors.white,
                                fontSize: 17),
                          ),*/
                      SizedBox(
                        width: phoneWidth * 0.3,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: phoneHeight * 0.05,
                            width: phoneWidth * 0.25,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2,
                                  offset: Offset(1, 1),
                                ),
                              ],
                            ),
                            child: FittedBox(
                              child: Text(
                                "${snapshot.data?.price} TL",
                                style: const TextStyle(fontFamily: "Arapey"),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: phoneHeight * 0.1,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            throw Error();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        } else {
          return FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return const Text("No active customer");
            },
          );
        }
      },
    );
  }
}