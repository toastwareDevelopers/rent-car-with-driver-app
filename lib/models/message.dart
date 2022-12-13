import 'package:rentcarmobile/utils/message_type.dart';

class Message {
  var content = "null";
  //var messageType = MessageType.Sent;
  String messageType = "null";
  var time = "00:00";
  String senderID = "-1";
  String receiverID = "-1";
  String roomID = "-1";
  Message(this.content, this.messageType, this.time);
  Message.msg(this.content, this.messageType, this.time, this.senderID,
      this.receiverID, this.roomID);
}
