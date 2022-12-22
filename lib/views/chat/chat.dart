import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rentcarmobile/widgets/person_chat_widget.dart';

import '../../constants/assets_path.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    List<PersonChatWidget> listPersonChat = [
      PersonChatWidget(
          id: "id",
          photo: "null",
          name: "Berkan",
          surname: "Akın",
          last_message: "Nereden alayim",
          last_message_time: "12-20-2022"),
      PersonChatWidget(
          id: "id",
          photo: "null",
          name: "Alperen",
          surname: "Dönmez",
          last_message: "10 dk'ya ordayim",
          last_message_time: "12-20-2022"),
      PersonChatWidget(
          id: "id",
          photo: "null",
          name: "Eray",
          surname: "Yasar",
          last_message: "Bir hafta surecek",
          last_message_time: "12-20-2022"),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 167, 117, 77),
        title: const Text("My Chats"),
        centerTitle: true,
        actions: [],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(children: listPersonChat),
      ),
    );
  }
}
