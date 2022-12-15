import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/utils/message_type.dart';

import '../views/chat/message_screen.dart';

class OfferBox extends StatelessWidget {
  const OfferBox(
      {Key? key,
      required this.id,
      required this.driverId,
      required this.customerId,
      required this.location,
      required this.price,
      required this.startDate,
      required this.endDate,
      required this.offerDescription,
      required this.status})
      : super(key: key);

  final String id;
  final String driverId;
  final String customerId;
  final String location;
  final int price;
  final String startDate;
  final String endDate;
  final String offerDescription;
  final String status;

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.1),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.3),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    border: Border.all(
                        color: Theme.of(context).highlightColor, width: 4)),
                child: Center(
                  child: Text(
                    "Offer",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: phoneWidth * 0.03, vertical: phoneHeight * 0.01),
            height: phoneHeight * 0.4,
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Start Date",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: phoneHeight * 0.04,
                                child: TextField(
                                  controller:
                                      TextEditingController(text: startDate),
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: phoneWidth * 0.02,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "End Date",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: phoneHeight * 0.04,
                                child: TextField(
                                  readOnly: true,
                                  controller:
                                      TextEditingController(text: endDate),
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: phoneHeight * 0.04,
                                child: TextField(
                                  readOnly: true,
                                  controller: TextEditingController(
                                      text: price.toString()),
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: phoneWidth * 0.02,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Location",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: phoneHeight * 0.04,
                                child: TextField(
                                  readOnly: true,
                                  controller:
                                      TextEditingController(text: location),
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Details",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller:
                            TextEditingController(text: offerDescription),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          isDense: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: status == "Accepted" ||
                          status == "Rejected" ||
                          status == "Waiting" && RentVanApp.userType == "driver"
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: phoneWidth * 0.25),
                          child: Container(
                            decoration: BoxDecoration(
                              color: status == "Rejected"
                                  ? Color.fromARGB(255, 149, 51, 51)
                                  : status == "Accepted"
                                      ? Color.fromARGB(255, 72, 124, 60)
                                      : Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                status,
                                style: TextStyle(
                                    color: status == "Waiting"
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ),
                          ))
                      : Container(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    minimumSize: MaterialStatePropertyAll(Size.fromWidth(phoneWidth*0.3)),
                                    backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 149, 51, 51),
                                    ),
                                  ),
                                  child: Text("Reject"),
                                  onPressed: () {},
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    minimumSize: MaterialStatePropertyAll(Size.fromWidth(phoneWidth*0.3)),
                                    backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 72, 124, 60),
                                    ),
                                  ),
                                  child: Text("Accept"),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
