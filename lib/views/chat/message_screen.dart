import 'package:flutter/material.dart';
import 'package:rentcarmobile/constants/api_path.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/models/offer.dart';
import 'package:rentcarmobile/services/mains.dart';
import 'package:rentcarmobile/utils/message_type.dart';
import 'package:rentcarmobile/widgets/message_bubble_widget.dart';
import 'package:rentcarmobile/widgets/offer_box_widget.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../constants/assets_path.dart';
import '../../models/message.dart';

class MessageScreen extends StatefulWidget {
  List<Message> messages = [
    /*Message("asdasdasdas", MessageType.Received, "20:13"),
    Message("jwfıjnwefnewuhfuewhfuhewufhewhfuıewjhfıuewhfuıewhuıfhwe",
        MessageType.Sent, "20:13"),
    Message(
        "ıewjfıeuwjfıujewufjdıuewjfuıejwıufjıuwefj", MessageType.Sent, "20:13"),
    Message(
        "wekjfoıerjfıreıufuerhfuıdwekocmnıewfbuıerwfıjermfjkmerkjfnuhrebncuhnwercjnjwencdew",
        MessageType.Received,
        "20:13"),
    Message("wkledıowejdıojewıujdıuewjduweıdj", MessageType.Received, "20:13"),
    Message("wedjuıwejdıujweıuhfuıwenxuıewndıewjfıjweıujuıewhnudfnwedf",
        MessageType.Received, "20:13"),
    Message(
        "weıofjıweurhfıuewhrfıujweıodjuyewbfıukfmıoewubfuyhweuıjfıowejfıuewhf",
        MessageType.Sent,
        "20:13"),
    Message(
        "wlıxıoewjdıuewhyfuhjewodcıuerwhufhjweıofdmjhwnuwemkdnewjhfoewmuwehfuıwhfıuwehfıuwehfıuhweıufdhew",
        MessageType.Received,
        "20:13"),
    Message("wıefjıuwehfuıewhuıfhıuwehfjıuwejdıuhjweıudhewuıhdıuwehfıudhweıufh",
        MessageType.Sent, "20:13"),
    Message(
        "oıjıjıujıujerıwjırjweıdjıewjndıwjendıujnweıdjıweujdıuewjıudjuıwejuıhruıwehduıewh",
        MessageType.Received,
        "20:13"),
    Offer(
        id: "1212",
        customerId: "12313",
        driverId: "23423",
        startDate: "21-02-2022",
        endDate: "23-02-2022",
        location: "Istanbul",
        price: 290,
        offerDescription: "djsfefıjeıfjeıfkıoekrfıoekrfe",
        status: "Waiting"),
    Message(
        "jeıoj2ıojıojıojoıjıjıdjfnıwejncıuwencıuwencıuwnecıuwneıuncıuwejndf",
        MessageType.Received,
        "20:13"),
    Message("oıdjcıosjdkcmkjmwecmweıocmweıocmıowemcıowemcıowem",
        MessageType.Received, "20:13"),
    Message(
        "wlekfıowekjfıowejfıewjfıujewıufjıwejfıewckjwmexewlxlkwmexkwenfewjnfjwenf",
        MessageType.Received,
        "20:13"),
    Message("asdaswedwddasdas", MessageType.Received, "20:13"),
    Message("asdaswedewfwefecwxewewddasdas", MessageType.Sent, "20:13"),
    Message("asdasqwdweddwedwdasdas", MessageType.Received, "20:13"),
    Message("erfgerfıjweıuhduewhduyhewuydhyuewhduywehuydh",
        MessageType.Received, "20:13"),
    Message("kjıuwjujuju", MessageType.Sent, "20:13"),
    Message(
        "wefkjwehfıuwneufhuwenduwuıejdıuwejıudfjhewuıhfuıwgfcwmıxweıjdıuwhed",
        MessageType.Received,
        "20:13"),
    Message("ujhdsıuchıuuıweuıhweud", MessageType.Sent, "20:13"),
    Message(
        "ushduhıuewhduıwheudıhwedwefewufjuewf", MessageType.Received, "20:13"),
    Message("asduxuzuzuxuxuxuuxxuuxuxudujwkeowruıwerasdasdas",
        MessageType.Received, "20:13"),
    Message("kskjdskjf", MessageType.Received, "20:13"),
    Message("rjfıjerıfjıerjfırejfıjeruıfuıenrcnewnruwe", MessageType.Received,
        "20:13"),
    Message("jdwdjwu", MessageType.Received, "20:13"),
    Message(
        "ewjdıjweıdwexelwjjfuıehfkuhafuhfuhfkuyehfueknceıruncıuenwkchuıerhfueırhfucneırunwcıuehkrckuerncuerkncuerkcnuekw",
        MessageType.Received,
        "20:13"),
    Message("sdkjfıulweufjıuernfıuwlfhjıuenwruflhenıjernfuıernf",
        MessageType.Received, "20:13"),
    Message(
        "wıejdıowemlqıwjdflıewufjıeurlfnerlıfjıleruhgfeıwoşjrfıojerıufjıeujfwıluer",
        MessageType.Sent,
        "20:13"),
    Message("wefwefw", MessageType.Sent, "20:13"),
    Message("wefkjweıjferfıuejrıferf", MessageType.Received, "20:13"),
    Message("ewfwıfjeırufjuıejfıuejwrfıujeruıwfjıuewrjfhıuewljrfıuwerfewrferf",
        MessageType.Sent, "20:13"),
    Message(
        "oıjdlıejrwıemrfıneruıvnueırbnvuwhebruvyhwekufhekwfhjuıerwhfıuehrfwlerıwlıufr",
        MessageType.Sent,
        "20:13"),
    Message("skdjfısjdıjfıerujfıoewjfıowjfıukwfeıjrfıuewfl",
        MessageType.Received, "20:13"),
    Message(
        "ıwejıljerıujfhıluerhjflıuejrfılwjerılfjewlıfjlwefılerwjflıewrjflıewjflıwejrf",
        MessageType.Received,
        "20:13"),
    Message("efkjweujfılwejhrıfujwefr", MessageType.Sent, "20:13"),
    Message("jıwejrıwjerıojweıorjıowjer", MessageType.Sent, "20:13"),*/
  ];
  List<Message> oldMsgs = [];
  String receiverId;
  MessageScreen({super.key, this.receiverId = "null"});
  State<MessageScreen> createState() => _MessageScreenState();

  TextEditingController messageController = TextEditingController();
}

class _MessageScreenState extends State<MessageScreen> {
  IO.Socket? socket;

  String roomID = "null";
  List<Message> listMsg = [];
  @override
  void initState() {
    super.initState();
    connect();
    roomID = RentVanApp.userType == "customer"
        ? widget.receiverId + RentVanApp.userId
        : RentVanApp.userId + widget.receiverId;
    startChat(roomID);
  }

  void connect() {
    socket = IO.io('http://${ApiPaths.serverIP}', <String?, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    socket!.onConnect((_) {
      print("connected frontend");

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
        }
      });
      socket!.on("old_messages", (messages) {
        for (var msg in messages) {
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
        }
      });
    });
  }

  void startChat(String msg) {
    socket!.emit("startChat", {
      "roomID": msg,
    });
  }

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

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    // receiverId = ModalRoute.of(context)!.settings.arguments as String;
    //receiverId = arguments['receiverId'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).highlightColor,
        titleSpacing: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/profileCustomer");
              },
              child: CircleAvatar(
                backgroundColor: Theme.of(context).highlightColor,
                radius: 20,
                child: CircleAvatar(
                  backgroundImage: AssetImage(AssetPaths.blankProfilePhotoPath),
                  radius: 18.0,
                ),
              ),
            ),
            SizedBox(
              width: phoneWidth * 0.03,
            ),
            const Text("Receiver Name"),
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
                child: Icon(
                  Icons.attach_money_sharp,
                  color: Colors.black45,
                ),
                onPressed: () {
                  showOffer(context, phoneHeight, phoneWidth);
                },
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
                itemBuilder: ((context, index) => Container(
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
                              id: (widget.messages[index] as Offer).id
                                  as String,
                              customerId: (widget.messages[index] as Offer)
                                  .customerId as String,
                              driverId: (widget.messages[index] as Offer)
                                  .driverId as String,
                              location: (widget.messages[index] as Offer)
                                  .location as String,
                              price: (widget.messages[index] as Offer).price
                                  as int,
                              startDate: (widget.messages[index] as Offer)
                                  .startDate as String,
                              endDate: (widget.messages[index] as Offer).endDate
                                  as String,
                              offerDescription:
                                  (widget.messages[index] as Offer)
                                      .offerDescription as String,
                              status: (widget.messages[index] as Offer).status
                                  as String,
                            ),
                    )),
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
                  //for starting chat temporarily
                  /* ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    onPressed: () {
                      startChat("msg");
                    },
                    child: const Text("start chat"),
                  ),*/
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
                  onPressed: () {},
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
}
