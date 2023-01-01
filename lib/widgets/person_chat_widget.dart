import 'dart:convert';
import 'package:flutter/material.dart';
import '../constants/assets_path.dart';
import '../views/chat/message_screen.dart';

class PersonChatWidget extends StatelessWidget {
  final String id;
  final String photo;
  final String name;
  final String surname;
  final String lastMessage;
  final String lastMessageTime;

  const PersonChatWidget(this.id, this.photo, this.name, this.surname,
      this.lastMessage, this.lastMessageTime,
      {super.key});

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MessageScreen(
              receiverId: id,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: phoneWidth*0.03),
        alignment: Alignment.centerLeft,
        height: phoneHeight * 0.1,
        width: phoneWidth,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).highlightColor,
                  radius: 30,
                  child: CircleAvatar(
                    backgroundImage: photo == "null"
                        ? AssetImage(AssetPaths.blankProfilePhotoPath)
                        : Image.memory(base64Decode(photo)).image,
                    radius: 26.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "$name $surname",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        lastMessage,
                        style: const TextStyle(
                          color: Colors.white60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "${lastMessageTime.split("T")[0]}\n${lastMessageTime.split("T")[1].substring(0, 5)}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
