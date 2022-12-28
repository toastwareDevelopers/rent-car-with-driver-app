import 'package:rentcarmobile/utils/message_type.dart';

class Message {
  var content = "null";
  //var messageType = MessageType.Sent;
  String messageType = "null";
  String createDate = DateTime.now().toString();
  String senderID = "null";
  String receiverID = "null";
  String roomID = "null";
  Message(this.content, this.messageType, this.createDate);
  Message.msg(this.content, this.messageType, this.createDate, this.senderID,
      this.receiverID, this.roomID);
}