import 'package:flutter/material.dart';
import 'package:rentcarmobile/main.dart';
import 'package:socket_io_client/socket_io_client.dart';

class OfferBox extends StatelessWidget {
  const OfferBox(
      {Key? key,
      required this.socket,
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
  final Socket? socket;
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
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    border: Border.all(
                        color: Theme.of(context).highlightColor, width: 4)),
                child: const Center(
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
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Start Date",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: phoneHeight * 0.04,
                                child: TextField(
                                  controller: TextEditingController(
                                      text: startDate.substring(0, 10)),
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
                              const Text(
                                "End Date",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: phoneHeight * 0.04,
                                child: TextField(
                                  readOnly: true,
                                  controller: TextEditingController(
                                      text: endDate.substring(0, 10)),
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Price",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            const SizedBox(
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
                            const Text(
                              "Location",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            const SizedBox(
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
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Details",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        readOnly: true,
                        controller:
                            TextEditingController(text: offerDescription),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: const InputDecoration(
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
                                  ? const Color.fromARGB(255, 149, 51, 51)
                                  : status == "Accepted"
                                      ? const Color.fromARGB(255, 72, 124, 60)
                                      : Colors.white,
                              borderRadius: const BorderRadius.all(
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
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStatePropertyAll(
                                    Size.fromWidth(phoneWidth * 0.3)),
                                backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 149, 51, 51),
                                ),
                              ),
                              child: const Text("Reject"),
                              onPressed: () {
                                socket!.emit(
                                  "respondOffer",
                                  {
                                    "roomID": driverId + customerId,
                                    "status": "Rejected",
                                    "offerId": id,
                                  },
                                );
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStatePropertyAll(
                                    Size.fromWidth(phoneWidth * 0.3)),
                                backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 72, 124, 60),
                                ),
                              ),
                              child: const Text("Accept"),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/payment',
                                  arguments: {
                                    'offer': this,
                                  },
                                );
                              },
                            ),
                          ],
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
