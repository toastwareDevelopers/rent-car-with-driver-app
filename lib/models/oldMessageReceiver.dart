import 'package:json_annotation/json_annotation.dart';
part 'oldMessageReceiver.g.dart';

@JsonSerializable()
class OldMessageReceiver {
  String? id;
  String? photo;
  String? name;
  String? surname;
  String? lastMessage;
  String? lastMessageTime;

  OldMessageReceiver({
    this.id = "null",
    this.photo = "null",
    this.name = "null",
    this.surname = "null",
    this.lastMessage = "01-01-1900",
    this.lastMessageTime = "01-01-1900",
  });

  factory OldMessageReceiver.fromJson(Map<String, dynamic> json) =>
      _$OldMessageReceiverFromJson(json);

  Map<String, dynamic> toJson() => _$OldMessageReceiverToJson(this);
}
