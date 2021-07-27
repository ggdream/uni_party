// /// WS传输的消息模型
// class ChatWrapper {
//   final int type;
//   final String time;
//   final String sign;
//   final String message;

//   ChatWrapper({
//     required this.type,
//     required this.time,
//     required this.sign,
//     required this.message,
//   });

//   ChatWrapper.fromJson(Map<String, dynamic> json)
//       : type = json['type'],
//         time = json['time'],
//         sign = json['sign'],
//         message = json['message'];

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['type'] = this.type;
//     data['time'] = this.time;
//     data['sign'] = this.sign;
//     data['message'] = this.message;
//     return data;
//   }
// }

import 'dart:convert';

enum ChatType {
  text,

  image,
  audio,
  video,

  fullSync,
}

class ChatWrapper {
  ChatWrapper({
    required this.type,
    required this.fromUID,
    required this.datetime,
    required this.version,
    required this.signature,
    this.toUID,
    this.groupID,
    this.message,
    this.url,
    this.others,
  });

  final ChatType type;

  final int fromUID;
  final int? toUID;
  final String? groupID;

  final String? message;
  final String? url;
  final dynamic others;

  final int datetime;
  final String version;
  final String signature;

  ChatWrapper.fromMap(Map<String, dynamic> json)
      : assert(!(json['to_uid'] != null && json['group_id'] != null)),
        type = ChatType.values[json['type']],
        fromUID = json['from_uid'],
        toUID = json['to_uid'],
        groupID = json['group_id'],
        message = json['message'],
        url = json['url'],
        others = json['others'],
        datetime = json['datetime'],
        version = json['version'],
        signature = json['signature'];

  Map<String, dynamic> toMap() {
    final data = new Map<String, dynamic>();
    data['type'] = type.index;
    data['from_uid'] = fromUID;
    if (toUID != null) data['to_uid'] = toUID;
    if (groupID != null) data['group_id'] = groupID;
    if (message != null) data['message'] = message;
    if (url != null) data['url'] = url;
    if (others != null) data['others'] = others;
    data['datetime'] = datetime;
    data['version'] = version;
    data['signature'] = signature;
    return data;
  }

  String toJson() => json.encode(toMap());
}
