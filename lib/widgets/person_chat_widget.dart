import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/assets_path.dart';
import '../views/chat/message_screen.dart';

class PersonChatWidget extends StatelessWidget {
  String id;
  String photo;
  String name;
  String surname;
  String last_message;
  String last_message_time;

  PersonChatWidget(
      {this.id = "null",
      this.photo = "null",
      this.name = "null",
      this.surname = "null",
      this.last_message = "null",
      this.last_message_time = "null"});

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => MessageScreen(receiverId: id,)));},
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: phoneWidth * 0.03),
        height: phoneHeight * 0.1,
        width: phoneWidth,
        child: Row(
          children: [
            Container(
              height: phoneHeight * 0.08,
              width: phoneWidth * 0.15,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                top: phoneHeight * 0.01,
                left: phoneWidth * 0.02,
                bottom: phoneHeight * 0.01,
                right: phoneWidth * 0.02,
              ),
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
            Container(
              height: phoneHeight * 0.06,
              width: phoneWidth * 0.6,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                top: phoneHeight * 0.02,
                bottom: phoneHeight * 0.02,
              ),
              //color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "$name $surname",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          last_message,
                          style: TextStyle(color: Colors.white60),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: phoneHeight * 0.08,
              width: phoneWidth * 0.2,
              margin: EdgeInsets.only(
                  top: phoneHeight * 0.02, bottom: phoneHeight * 0.02),
              // color: Colors.green,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: phoneHeight * 0.02, bottom: phoneHeight * 0.02),
                        alignment: Alignment.center,
                        child: Text(
                          last_message_time,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ); // geçmis seyahat;
  }
}
