// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oldMessageReceiver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
OldMessageReceiver _$OldMessageReceiverFromJson(Map<String, dynamic> json) {
  return OldMessageReceiver(
    id: json['id'] as String?,
    photo: json['photo'] as String?,
    name: json['name'] as String?,
    surname: json['surname'] as String?,
    lastMessage: json['lastMessage'] as String?,
    lastMessageTime: json['lastMessageTime'] as String?,
  );
}

Map<String, dynamic> _$OldMessageReceiverToJson(OldMessageReceiver instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'photo': instance.photo,
      'lastMessage': instance.lastMessage,
      'lastMessageTime': instance.lastMessageTime,
    };
