import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rentcarmobile/main.dart';
import 'package:rentcarmobile/services/chat_service.dart';
import 'package:rentcarmobile/widgets/person_chat_widget.dart';

import '../../constants/assets_path.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

@override
void initState() {
  ChatService.getMessageHistory(RentVanApp.userId);
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 167, 117, 77),
        title: const Text("My Chats"),
        centerTitle: true,
        actions: [],
      ),
      body: FutureBuilder(
          future: ChatService.getMessageHistory(RentVanApp.userId),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.data != null) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (contextv2, index) => PersonChatWidget(
                      snapshot.data?[index].id,
                      snapshot.data?[index].photo,
                      snapshot.data?[index].name,
                      snapshot.data?[index].surname,
                      snapshot.data?[index].lastMessage,
                      snapshot.data?[index].lastMessageTime,
                    ),
                  ),
                );
              } else {
                return Container();
              }
            } else {
              return Container();
            }
          }),
    );
  }
}
