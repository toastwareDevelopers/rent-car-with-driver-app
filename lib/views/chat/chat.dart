import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rentcarmobile/widgets/person_chat_widget.dart';

import '../../constants/assets_path.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    List<PersonChat> listPersonChat = [PersonChat("Berkan", "Nereden alayim", "12-20-2022"),
      PersonChat("Alperen Donmez", "10 dk'ya ordayim", "12-20-2022"),
      PersonChat("Eray Yasar", "Bir hafta surecek", "12-20-2022"),];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 167, 117, 77),
        title: const Text("CHATS"),
        centerTitle: true,
        actions: [],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: listPersonChat
          )),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
