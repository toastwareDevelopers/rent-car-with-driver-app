import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rentcarmobile/constants/api_path.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/models/customer.dart';
import 'package:rentcarmobile/models/offer.dart';
import 'package:rentcarmobile/services/profile.dart';
import 'package:rentcarmobile/widgets/message_bubble_widget.dart';
import 'package:rentcarmobile/widgets/offer_box_widget.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../constants/assets_path.dart';
import '../../models/driver.dart';
import '../../models/message.dart';

class MessageScreen extends StatefulWidget {
  List<dynamic> messages = [];
  String receiverId = "null";
  String? receiverName = "...";
  String? receiverSurname = "";
  String? receiverPhoto = "null";
  MessageScreen({super.key, this.receiverId = "null"});
  State<MessageScreen> createState() => _MessageScreenState();
  bool oldMsgGet = false;
  TextEditingController messageController = TextEditingController();
}

class _MessageScreenState extends State<MessageScreen> {
  IO.Socket? socket;
  ScrollController _scrollController = ScrollController();
  String roomID = "null";
  @override
  void initState() {
    getReceiverInfo();
    super.initState();
    widget.messages = [];
    roomID = RentVanApp.userType == "customer"
        ? widget.receiverId + RentVanApp.userId
        : RentVanApp.userId + widget.receiverId;
    connect();
    startChat(roomID);
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Theme.of(context).highlightColor,
        titleSpacing: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/profileCustomer");
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 23,
                child: CircleAvatar(
                  backgroundImage: widget.receiverPhoto == "null"
                      ? AssetImage(AssetPaths.blankProfilePhotoPath)
                      : Image.memory(base64Decode(widget.receiverPhoto!)).image,
                  radius: 20.0,
                ),
              ),
            ),
            SizedBox(
              width: phoneWidth * 0.03,
            ),
            Text(widget.receiverName! + " " + widget.receiverSurname!),
          ],
        ),
      ),
      floatingActionButton: RentVanApp.userType == "driver"
          ? Padding(
              padding: EdgeInsets.only(
                  bottom: phoneHeight * 0.06, left: phoneWidth * 0.9),
              child: FloatingActionButton(
                mini: true,
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.attach_money_sharp,
                  color: Colors.black45,
                ),
                onPressed: () {
                  showOffer(context, phoneHeight, phoneWidth);
                },
                heroTag: "button1",
              ),
            )
          : null,
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            //Messages area
            Container(
              child: ListView.separated(
                controller: _scrollController,
                itemBuilder: ((context, index) {
                  return Container(
                    child: widget.messages[index] is Message
                        ? MessageBubble(
                            content:
                                (widget.messages[index] as Message).content,
                            time: (widget.messages[index] as Message)
                                .createDate
                                .toString(),
                            sender:
                                (widget.messages[index] as Message).senderID,
                          )
                        : OfferBox(
                            socket: socket,
                            id: (widget.messages[index] as Offer).id as String,
                            customerId: (widget.messages[index] as Offer)
                                .customerId as String,
                            driverId: (widget.messages[index] as Offer).driverId
                                as String,
                            location: (widget.messages[index] as Offer).location
                                as String,
                            price:
                                (widget.messages[index] as Offer).price as int,
                            startDate: (widget.messages[index] as Offer)
                                .startDate as String,
                            endDate: (widget.messages[index] as Offer).endDate
                                as String,
                            offerDescription: (widget.messages[index] as Offer)
                                .offerDescription as String,
                            status: (widget.messages[index] as Offer).status
                                as String,
                          ),
                  );
                }),
                separatorBuilder: (context, index) => SizedBox(
                  height: phoneHeight * 0.015,
                ),
                itemCount: widget.messages.length,
                padding: EdgeInsets.only(
                    bottom: phoneHeight * 0.085, top: phoneHeight * 0.01),
              ),
            ),

            //Text enter area
            Container(
              padding: EdgeInsets.all(5),
              decoration:
                  BoxDecoration(color: Theme.of(context).highlightColor),
              height: phoneHeight * 0.07,
              width: phoneWidth,
              child: Row(
                children: [
                  //Text Enter area
                  Expanded(
                    flex: 12,
                    child: TextFormField(
                      maxLines: 5,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration:
                          const InputDecoration(fillColor: Colors.white),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: widget.messageController,
                    ),
                  ),
                  //Send button
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                            CircleBorder(),
                          ),
                          minimumSize:
                              MaterialStatePropertyAll(Size.fromHeight(45)),
                        ),
                        onPressed: () {
                          scrollControl();
                          String msg = widget.messageController.text;
                          if (msg.isNotEmpty) {
                            sendMsg(msg);
                            widget.messageController.clear();
                          }
                        },
                        child: const Center(
                          child: Icon(
                            Icons.send,
                            color: Colors.black45,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showOffer(
      BuildContext context, double phoneHeight, double phoneWidth) {
    TextEditingController offerStartDateController = TextEditingController();
    TextEditingController offerEndDateController = TextEditingController();
    TextEditingController offerPriceController = TextEditingController();
    TextEditingController offerLocationController = TextEditingController();
    TextEditingController offerDetailsController = TextEditingController();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            titlePadding: EdgeInsets.all(10),
            title: Center(
              child: Text(
                "Make Offer",
                style: TextStyle(color: Colors.white),
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            content: Container(
              height: phoneHeight * 0.4,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: offerStartDateController,
                              decoration: InputDecoration(
                                hintText: "Start Date",
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.02,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: offerEndDateController,
                              decoration: InputDecoration(
                                hintText: "End Date",
                                fillColor: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: offerPriceController,
                              decoration: InputDecoration(
                                hintText: "Price",
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: phoneWidth * 0.02,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: offerLocationController,
                              decoration: InputDecoration(
                                hintText: "Location",
                                fillColor: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: phoneHeight * 0.008,
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      controller: offerDetailsController,
                      decoration: InputDecoration(
                        hintText: "Details",
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: phoneWidth * 0.25),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      textStyle: MaterialStatePropertyAll(
                          TextStyle(color: Colors.red))),
                  onPressed: () {
                    sendOffer(
                        offerStartDateController.text,
                        offerEndDateController.text,
                        int.parse(offerPriceController.text),
                        offerLocationController.text,
                        offerDetailsController.text,
                        "Waiting");
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Text(
                      "Offer",
                      style:
                          TextStyle(color: Colors.black, fontFamily: "Arapey"),
                    ),
                  ),
                ),
              )
            ],
            backgroundColor: Theme.of(context).highlightColor,
          );
        });
  }

  // when a message is sent or received, scroll the screen to see the new message
  void scrollControl() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      double prev = 0;
      do {
        prev = _scrollController.position.maxScrollExtent;
        if (_scrollController.hasClients) {
          _scrollController.position
              .jumpTo(_scrollController.position.maxScrollExtent);
        }
      } while (prev != _scrollController.position.maxScrollExtent);
    });
  }

  // get the receiver name to display on sender's screen
  void getReceiverInfo() async {
    if (RentVanApp.userType == "driver") {
      Driver driver = await ProfileService.getDriver(widget.receiverId);
      widget.receiverName = driver.name;
      widget.receiverSurname = driver.surname;
      widget.receiverPhoto = driver.profileImage;
    } else {
      Customer customer = await ProfileService.getCustomer(widget.receiverId);
      widget.receiverName = customer.name;
      widget.receiverSurname = customer.surname;
      widget.receiverPhoto = customer.profileImage;
    }
    // sometimes receiver info cannot be updated, refreshing solves the problem
    setState(() {});
  }

  // connect to socket
  void connect() {
    socket = IO.io('http://${ApiPaths.serverIP}', <String?, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
      'forceNew': true,
    });
    socket!.connect();

    socket!.onConnect((_) {
      print("connected frontend");
      //get the messages
      socket!.on("sendmessage", (msg) {
        print(msg);

        if (msg["senderID"] != RentVanApp.userId) {
          setState(() {
            widget.messages.add(Message.msg(
              msg["content"],
              "null",
              msg["createDate"],
              msg["senderID"],
              msg["receiverID"],
              msg["roomID"],
            ));
          });
          scrollControl();
        }
      });
      // get the response of the offer
      socket!.on("respondOffer", (response) {
        print(response);

        if (true) {
          setState(() {
            String offerId = response["offerId"];
            String newStatus = response["status"];
            for (var msg in widget.messages) {
              if (msg is Offer) {
                if (msg.id == offerId) {
                  msg.status = newStatus;
                }
              }
            }
          });
        }
      });
      // get the offer
      socket!.on("offer", (offer) {
        print(offer);

        setState(() {
          widget.messages.add(Offer.get(
            offer["_id"],
            offer["startDate"],
            offer["endDate"],
            offer["price"],
            offer["location"],
            offer["offerDescription"],
            offer["driverId"],
            offer["customerId"],
            offer["status"],
          ));
        });
        scrollControl();
      });

      print("connection completed");
    });
  }

  @override
  void dispose() {
    if (socket != null) {
      socket!.disconnect();
    }
    super.dispose();
  }

  void startChat(String msg) {
    socket!.emit("startChat", {
      "roomID": msg,
    });
    // load old messages when chat is started
    socket!.on("old_messages", (messages) {
      for (var msg in messages) {
        if (msg["type"] == "message") {
          widget.messages.add(Message.msg(
            msg["content"],
            "messsage",
            msg["createDate"],
            msg["senderID"],
            msg["receiverID"],
            msg["roomID"],
          ));
        } else {
          widget.messages.add(Offer.get(
            msg["_id"],
            msg["startDate"],
            msg["endDate"],
            msg["price"],
            msg["location"],
            msg["offerDescription"],
            msg["driverId"],
            msg["customerId"],
            msg["status"],
          ));
        }
      }
      setState(() {
        widget.messages;
      });
      scrollControl();
    });
  }

  // send the response to the offer to backend
  void respondOffer(Offer offer) {
    socket!.emit("respondOffer", {
      "roomID": roomID,
      "status": offer.status,
      "offerId": offer.id,
    });
  }

  // save the offer and send to backend
  void sendOffer(String startDate, String endDate, int price, String location,
      String offerDescription, String status) {
    setState(() {
      widget.messages;
    });
    scrollControl();
    socket!.emit("offer", {
      "startDate": startDate,
      "endDate": endDate,
      "price": price,
      "location": location,
      "offerDescription": offerDescription,
      "status": status,
      "driverId": RentVanApp.userId,
      "customerId": widget.receiverId,
      "roomID": roomID,
    });
  }

  // save the message and send to backed
  void sendMsg(String msg) {
    Message ownMsg = Message.msg(msg, "message", DateTime.now().toString(),
        RentVanApp.userId, widget.receiverId, roomID);
    widget.messages.add(ownMsg);
    setState(() {
      widget.messages;
    });
    socket!.emit("sendmessage", {
      "type": "message",
      "createDate": DateTime.now().toString(),
      "content": msg,
      "senderID": RentVanApp.userId,
      "receiverID": widget.receiverId,
      "roomID": roomID,
    });
  }
}
