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
    required this.data,
    required this.time,
    required this.version,
    required this.signature,
  });

  final ChatType type;
  final dynamic data;
  final int time;
  final String version;
  final String signature;
}

/// 普通消息
class TextMsg {
  TextMsg({
    required this.uid,
    required this.text,
    this.gid,
  });

  final int uid;
  final String text;

  final String? gid; // 群号

  TextMsg.fromMap(Map<String, dynamic> json)
      : uid = json['uid'],
        gid = json['gid'],
        text = json['text'];

  Map<String, dynamic> toMap() {
    final data = Map<String, dynamic>();
    data['uid'] = uid;
    data['gid'] = gid;
    data['text'] = text;
    return data;
  }
}

/// 二进制文件地址消息
class BinaryMsg {
  BinaryMsg({
    required this.uid,
    required this.url,
    this.gid,
  });

  final int uid;
  final String url;

  final String? gid; // 群号

  BinaryMsg.fromMap(Map<String, dynamic> json)
      : uid = json['uid'],
        gid = json['gid'],
        url = json['url'];

  Map<String, dynamic> toMap() {
    final data = Map<String, dynamic>();
    data['uid'] = uid;
    data['gid'] = gid;
    data['url'] = url;
    return data;
  }
}

class _SyncMsg {
  _SyncMsg({
    required this.type,
    required this.data,
    required this.time,
  });

  final ChatType type;
  final dynamic data;
  final int time;

  _SyncMsg.fromMap(Map<String, dynamic> json)
      : type = ChatType.values[json['type']],
        data = json['data'],
        time = json['time'];
}

class SyncMsg {
  SyncMsg({
    required this.messages,
  });

  late final List<_SyncMsg> messages;

  SyncMsg.fromMap(List<dynamic> _data) {
    for (var item in _data) {
      late Map<String, dynamic> res;
      try {
        res = json.decode(item);
      } catch (e) {}
      messages.add(_SyncMsg.fromMap(res));
    }
  }
}
