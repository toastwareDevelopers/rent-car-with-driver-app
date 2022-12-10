import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_10.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_3.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_7.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/utils/message_type.dart';
import 'package:rentcarmobile/widgets/message_bubble_widget.dart';

import '../../constants/assets_path.dart';
import '../../models/message.dart';

class MessageScreen extends StatefulWidget {
  var messages = [
    Message("asdasdasdas", MessageType.Received, "20:13"),
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
    Message("jıwejrıwjerıojweıorjıowjer", MessageType.Sent, "20:13"),
  ];
  MessageScreen({super.key});
  State<MessageScreen> createState() => _MessageScreenState();

  TextEditingController messageController = TextEditingController();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

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
            const Text("Harun Eren Ozkaya"),
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
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          titlePadding: EdgeInsets.all(10),
                          title: Center(
                              child: Text(
                            "Make Offer",
                            style: TextStyle(color: Colors.white),
                          )),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
                                                  hintText: "Start Date"),
                                            ),
                                          ),
                                          SizedBox(
                                            width: phoneWidth * 0.02,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "End Date"),
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
                                                  hintText: "Price"),
                                            ),
                                          ),
                                          SizedBox(
                                            width: phoneWidth * 0.02,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: "Location"),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: phoneHeight*0.008,),
                                  Expanded(
                                    flex: 3,
                                    child: TextFormField(
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 10,
                                      decoration:
                                          InputDecoration(hintText: "Details"),
                                    ),
                                  ),
                                ]),
                          ),
                          actions: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: phoneWidth * 0.25),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.white),
                                    textStyle: MaterialStatePropertyAll(
                                        TextStyle(color: Colors.red))),
                                onPressed: () {},
                                child: Center(
                                  child: Text(
                                    "Offer",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Arapey"),
                                  ),
                                ),
                              ),
                            )
                          ],
                          backgroundColor: Theme.of(context).highlightColor,
                        );
                      });
                },
              ),
            )
          : null,
      body: Container(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              child: ListView.separated(
                itemBuilder: ((context, index) => Container(
                      child: MessageBubble(
                          content: widget.messages[index].content,
                          time: widget.messages[index].time,
                          messageType: widget.messages[index].messageType),
                    )),
                separatorBuilder: (context, index) => SizedBox(
                  height: phoneHeight * 0.015,
                ),
                itemCount: widget.messages.length,
                padding: EdgeInsets.only(
                    bottom: phoneHeight * 0.085, top: phoneHeight * 0.01),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration:
                  BoxDecoration(color: Theme.of(context).highlightColor),
              height: phoneHeight * 0.07,
              width: phoneWidth,
              child: Row(
                children: [
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
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                            CircleBorder(),
                          ),
                          minimumSize:
                              MaterialStatePropertyAll(Size.fromHeight(45)),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Icon(
                            Icons.send,
                            color: Colors.black45,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
