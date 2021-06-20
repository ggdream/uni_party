/// Ping 请求
class ChatProtocolPingReqModel {
  final String message;

  ChatProtocolPingReqModel({
    required this.message,
  });

  ChatProtocolPingReqModel.fromJson(Map<String, dynamic> json)
      : message = json['message'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}

/// Ping 响应
class ChatProtocolPingResModel {
  final String message;

  ChatProtocolPingResModel({
    required this.message,
  });

  ChatProtocolPingResModel.fromJson(Map<String, dynamic> json)
      : message = json['message'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}

/// FullSync 请求
class ChatProtocolFullSyncReqModel {
  ChatProtocolFullSyncReqModel();

  ChatProtocolFullSyncReqModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

/// FullSync 响应
class ChatProtocolFullSyncResModel {
  late final int total;
  late final List<_Result> result;

  ChatProtocolFullSyncResModel({
    required this.total,
    required this.result,
  });

  ChatProtocolFullSyncResModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    result = [];
    json['result'].forEach((v) {
      result.add(new _Result.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['result'] = this.result.map((v) => v.toJson()).toList();
    return data;
  }
}

class _Result {
  final int fromUid;
  final String datetime;
  final String did;
  final String message;

  _Result({
    required this.fromUid,
    required this.datetime,
    required this.did,
    required this.message,
  });

  _Result.fromJson(Map<String, dynamic> json)
      : fromUid = json['from_uid'],
        datetime = json['datetime'],
        did = json['did'],
        message = json['message'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_uid'] = this.fromUid;
    data['datetime'] = this.datetime;
    data['did'] = this.did;
    data['message'] = this.message;
    return data;
  }
}

/// IncrSync 请求
class ChatProtocolIncrSyncReqModel {
  final String uid;
  final String pointer;
  final String number;

  ChatProtocolIncrSyncReqModel({
    required this.uid,
    required this.pointer,
    required this.number,
  });

  ChatProtocolIncrSyncReqModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        pointer = json['pointer'],
        number = json['number'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['pointer'] = this.pointer;
    data['number'] = this.number;
    return data;
  }
}

/// IncrSync 响应
class ChatProtocolIncrSyncResModel {
  late final int total;
  late final List<_Result> result;

  ChatProtocolIncrSyncResModel({
    required this.total,
    required this.result,
  });

  ChatProtocolIncrSyncResModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    result = [];
    json['result'].forEach((v) {
      result.add(new _Result.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['result'] = this.result.map((v) => v.toJson()).toList();
    return data;
  }
}

/// Chat 请求
class ChatProtocolChatReqModel {
  final String message;
  final String toUid;

  ChatProtocolChatReqModel({
    required this.message,
    required this.toUid,
  });

  ChatProtocolChatReqModel.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        toUid = json['to_uid'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['to_uid'] = this.toUid;
    return data;
  }
}

/// Chat 响应
class ChatProtocolChatResModel {
  final String datetime;
  final String message;

  ChatProtocolChatResModel({
    required this.datetime,
    required this.message,
  });

  ChatProtocolChatResModel.fromJson(Map<String, dynamic> json)
      : datetime = json['datetime'],
        message = json['message'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['datetime'] = this.datetime;
    data['message'] = this.message;
    return data;
  }
}

/// Notify 请求
class ChatProtocolNotifyReqModel {
  final String message;

  ChatProtocolNotifyReqModel({
    required this.message,
  });

  ChatProtocolNotifyReqModel.fromJson(Map<String, dynamic> json)
      : message = json['message'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}

/// Notify 响应
class ChatProtocolNotifyResModel {
  ChatProtocolNotifyResModel();

  ChatProtocolNotifyResModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
