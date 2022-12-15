import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/utils/message_type.dart';

import '../views/chat/message_screen.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {Key? key,
      required this.content,
      required this.time,
      required this.sender})
      : super(key: key);

  final String sender;
  final String content;
  final String time;

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return ChatBubble(
      padding: RentVanApp.userId == sender
          ? EdgeInsets.only(
              left: phoneWidth * 0.02,
              right: phoneWidth * 0.04,
              top: phoneHeight * 0.005,
              bottom: phoneHeight * 0.005)
          : EdgeInsets.only(
              left: phoneWidth * 0.04,
              right: phoneWidth * 0.02,
              top: phoneHeight * 0.005,
              bottom: phoneHeight * 0.005),
      elevation: 0,
      alignment: RentVanApp.userId == sender
          ? Alignment.centerRight
          : Alignment.centerLeft,
      backGroundColor: RentVanApp.userId == sender
          ? Theme.of(context).highlightColor
          : Colors.white,
      clipper: ChatBubbleClipper1(
          type: RentVanApp.userId == sender
              ? BubbleType.sendBubble
              : BubbleType.receiverBubble,
          nipWidth: 8),
      child: Container(
        constraints: BoxConstraints(maxWidth: phoneWidth * 0.8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content,
              style: TextStyle(
                  color: RentVanApp.userId == sender
                      ? Colors.white
                      : Colors.black),
            ),
            Text(time.substring(0, 16),
                style: TextStyle(
                    color: RentVanApp.userId == sender
                        ? Colors.white70
                        : Colors.black45,
                    fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
