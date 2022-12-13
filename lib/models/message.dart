import 'package:rentcarmobile/utils/message_type.dart';

class Message{
  var content = "null";
  var messageType = MessageType.Sent;
  var time = "00:00";

  Message(this.content,this.messageType,this.time);
}