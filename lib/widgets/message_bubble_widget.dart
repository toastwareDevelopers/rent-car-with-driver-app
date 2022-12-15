import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:rentcarmobile/utils/message_type.dart';

import '../views/chat/message_screen.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.content,
    required this.time,
    required this.messageType
  }) : super(key: key);

  final MessageType messageType;
  final String content;
  final String time;

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    
    return ChatBubble(
      padding: messageType ==
              MessageType.Sent
          ? EdgeInsets.only(left: phoneWidth*0.02,right: phoneWidth*0.04,top: phoneHeight*0.005,bottom: phoneHeight*0.005)
          : EdgeInsets.only(left: phoneWidth*0.04,right: phoneWidth*0.02,top: phoneHeight*0.005,bottom: phoneHeight*0.005),
      elevation: 0,
      alignment: messageType ==
              MessageType.Sent
          ? Alignment.centerRight
          : Alignment.centerLeft,
      backGroundColor: messageType ==
              MessageType.Sent
          ? Theme.of(context).highlightColor
          : Colors.white,
      clipper: ChatBubbleClipper1(
          type: messageType ==
                  MessageType.Sent
              ? BubbleType.sendBubble
              : BubbleType.receiverBubble,
          nipWidth: 8),
      child: Container(
        constraints:
            BoxConstraints(maxWidth: phoneWidth * 0.8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              content,
              style: TextStyle(
                  color: messageType ==
                          MessageType.Sent
                      ? Colors.white
                      : Colors.black),
            ),
            Text(
              time,
              style: TextStyle(
                  color: messageType ==
                          MessageType.Sent
                      ? Colors.white70
                      : Colors.black45,fontSize: 13)
            ),
          ],
        ),
      ),
    );
  }
}
