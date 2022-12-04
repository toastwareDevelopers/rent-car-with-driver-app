import 'package:flutter/material.dart';
import 'package:rentcarmobile/models/trip.dart';
import 'package:rentcarmobile/services/mains.dart';

class DriverMainScreen extends StatefulWidget {
  DriverMainScreen({super.key});
  List<Trip> trips = [];
  List<String> tripListString = [];
  List<Trip> tripsv2 = [
    Trip(
        id: "1",
        driverId: "1",
        customerId: "1",
        customerName: "eray1",
        customerSurname: "yaşar1",
        customerAge: 21,
        location: "karabük",
        price: 100),
  ];

  @override
  State<DriverMainScreen> createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    double phoneHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff282828),
        body: SizedBox(
          width: phoneWidth,
          height: phoneHeight,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: phoneHeight * 0.06, bottom: phoneHeight * 0.01),
                width: phoneWidth * 0.75,
                child: const Text(
                  "Active Customer",
                  style: TextStyle(color: Colors.white, fontFamily: 'Arapey'),
                ),
              ),
              getActiveTrip(phoneWidth, phoneHeight),
              Container(
                margin: EdgeInsets.only(
                    top: phoneHeight * 0.03, bottom: phoneHeight * 0.01),
                width: phoneWidth * 0.75,
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

  Container getActiveTrip(double phoneWidth, double phoneHeight) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffA7754D),
        border: Border.all(
          width: 5,
          color: const Color(0xffA7754D),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      height: phoneHeight * 0.125,
      width: phoneWidth * 0.77,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          children: [
            Image.asset(
              "lib/assets/images/blank-profile-photo.png",
              width: phoneWidth * .1,
              height: phoneHeight * .1,
            ),
            SizedBox(
              width: phoneWidth * 0.05,
            ),
            getActiveCustomerInfo(phoneWidth, phoneHeight),
          ],
        ),
      ),
    );
  }

  FittedBox listTrips(double phoneWidth, double phoneHeight) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 5,
            color: const Color(0xffA7754D),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        height: phoneHeight * 0.625,
        width: phoneWidth * 0.75,
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
                    width: phoneWidth * 0.75,
                    child: ListTile(
                      style: ListTileStyle.list,
                      title: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Row(
                          children: [
                            Image.asset(
                              "lib/assets/images/blank-profile-photo.png",
                              width: phoneWidth * .1,
                              height: phoneHeight * .1,
                            ),
                            SizedBox(
                              width: phoneWidth * 0.05,
                              height: phoneHeight * 0.05,
                            ),
                            Text(
                              "${snapshot.data?[index].customerName} (${snapshot.data?[index].customerAge}) \n"
                              "${snapshot.data?[index].location} \n"
                              "Start: ${snapshot.data?[index].startDate?.substring(0, 10)}\nFinish: ${snapshot.data?[index].endDate?.substring(0, 10)}",
                              style: const TextStyle(
                                  fontFamily: "Arapey",
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                            Container(
                              height: phoneHeight * 0.05,
                              width: phoneWidth * 0.1,
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
                                  style: const TextStyle(fontFamily: "Arapey"),
                                ),
                              ),
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
      ),
    );
  }

  FutureBuilder getActiveCustomerInfo(double phoneWidth, double phoneHeight) {
    return FutureBuilder(
      future: MainService.getDriverActiveTrip(widget.tripListString),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Row(
              children: [
                Text(
                  "${snapshot.data?.customerName} (${snapshot.data?.customerAge}) \n"
                  "${snapshot.data?.location} \n"
                  "Start: ${snapshot.data?.startDate?.substring(0, 10)} \nFinish: ${snapshot.data?.endDate?.substring(0, 10)}",
                  style: const TextStyle(
                      fontFamily: "Arapey", color: Colors.white, fontSize: 16),
                ),
                Container(
                  height: phoneHeight * 0.05,
                  width: phoneWidth * 0.1,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(3)),
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
              ],
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
