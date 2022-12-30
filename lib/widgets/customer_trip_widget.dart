import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/assets_path.dart';
import '../models/trip.dart';
import '../utils/base64_converter.dart';
import 'make_review.dart';

class CustomerTrip extends StatelessWidget {
  String driverName = "null";
  String driverSurname = "null";
  int? age = 0;
  String city = "null";
  String start_time = "null";
  String finish_time = "null";
  String tripId = "null";
  String driverId = "null";
  String customerId = "null";
  String reviewId = "null";
  String driverProfileImage = "null";

  CustomerTrip({
    this.driverName = "null",
    this.driverSurname = "null",
    this.age = 0,
    this.city = "null",
    this.start_time = "null",
    this.finish_time = "null",
    this.tripId = "null",
    this.driverId = "null",
    this.customerId = "null",
    this.reviewId = "null",
    this.driverProfileImage = "null",
  });

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 167, 117, 77),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          right: phoneWidth * 0.01, left: phoneWidth * 0.01),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 32,
                        child: CircleAvatar(
                          backgroundImage: driverProfileImage != "null"
                              ? Image.memory(Base64Converter.decodeImage64(
                                      driverProfileImage))
                                  .image
                              : AssetImage(AssetPaths.blankProfilePhotoPath),
                          radius: 30.0,
                        ),
                      ),
                    ),
                    Column(
                      // trips
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "$driverName $driverSurname",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        Container(
                          color: Color.fromARGB(2, 3, 5, 7),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            city,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Start : ${start_time.substring(0, 10)}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: phoneWidth * 0.02),
                              child: Text(
                                "End : ${finish_time.substring(0, 10)}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: phoneWidth * 0.13,
                height: phoneHeight * 0.03,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Center(
                  child: const Text(
                    "100 TL",
                  ),
                ),
              ),
            ],
          ),
          reviewId == "null"
              ? Container(
                  height: phoneHeight * 0.03,
                  width: phoneWidth * 0.17,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      showReviewBox(context, phoneHeight, phoneWidth);
                    },
                    child: const Text(
                      "Review",
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    ); // geçmis seyahat;
  }

  Future<dynamic> showReviewBox(
      BuildContext context, double phoneHeight, double phoneWidth) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: ((BuildContext context2) => StatefulBuilder(
            builder: (context3, setState) => Container(
              padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.1),
              height: phoneHeight * 0.55,
              decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                color: Color.fromARGB(255, 167, 117, 77),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 167, 117, 77),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  right: phoneWidth * 0.01,
                                  left: phoneWidth * 0.01),
                              child: const CircleAvatar(
                                backgroundImage: AssetImage(
                                    'lib/assets/images/blank-profile-photo.png'),
                                radius: 30,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "name",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                                Container(
                                  color: Color.fromARGB(2, 3, 5, 7),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "city",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const Text(
                                        "Start 12-01-2022",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(
                                          left: phoneWidth * 0.02),
                                      child: const Text(
                                        "Finish 12-01-2022",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Review",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                child: TextField(
                                  keyboardType: TextInputType.multiline,
                                  decoration:
                                      InputDecoration(hintText: "Message"),
                                  maxLines: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex : 2,
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(hintText: "Rating"),
                                    style:
                                        TextStyle(fontSize: 16.0, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: phoneWidth*0.3,),
                            Expanded(
                              flex: 2,
                              child: Container(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,),
                                  child: Text(
                                    "Send",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () async {
                                    /*
                                  await Future.wait([
                                    ProfileService.postCustomerReview(
                                        customerId, driverId, "sadsad", "asd", tripId),
                                  ]);*/
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
