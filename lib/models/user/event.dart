/// 获取用户发布的消息：请求
class UserPublicationsEventGetReqModel {
  final String uid;
  final int offset;
  final int number;

  UserPublicationsEventGetReqModel({
    required this.uid,
    required this.offset,
    required this.number,
  });

  UserPublicationsEventGetReqModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        offset = json['offset'],
        number = json['number'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['offset'] = this.offset;
    data['number'] = this.number;
    return data;
  }
}

/// 获取用户发布的消息：响应
class UserPublicationsEventGetResModel {
  late final int total;
  late final List<_Events> events;

  UserPublicationsEventGetResModel({
    required this.total,
    required this.events,
  });

  UserPublicationsEventGetResModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    events = [];
    json['events'].forEach((v) {
      events.add(new _Events.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['events'] = this.events.map((v) => v.toJson()).toList();
    return data;
  }
}

/// 获取用户收藏的消息：请求
class UserCollectionsEventGetReqModel {
  final String uid;
  final int offset;
  final int number;

  UserCollectionsEventGetReqModel({
    required this.uid,
    required this.offset,
    required this.number,
  });

  UserCollectionsEventGetReqModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        offset = json['offset'],
        number = json['number'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['offset'] = this.offset;
    data['number'] = this.number;
    return data;
  }
}

/// 获取用户收藏的消息：请求
class UserCollectionsEventGetResModel {
  late final int total;
  late final List<_Events> events;

  UserCollectionsEventGetResModel({
    required this.total,
    required this.events,
  });

  UserCollectionsEventGetResModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['events'] != null) {
      events = [];
      json['events'].forEach((v) {
        events.add(new _Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
      data['events'] = this.events.map((v) => v.toJson()).toList();
    return data;
  }
}

class _Events {
  final String eid;
  final List<String> tags;
  final int type;
  final String title;
  final int getCounter;
  final int watchCounter;
  final int commentCounter;
  final String createTime;
  final String updateTime;

  _Events({
    required this.eid,
    required this.tags,
    required this.type,
    required this.title,
    required this.getCounter,
    required this.watchCounter,
    required this.commentCounter,
    required this.createTime,
    required this.updateTime,
  });

  _Events.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        tags = List<String>.from(json['tags']),
        type = json['type'],
        title = json['title'],
        getCounter = json['get_counter'],
        watchCounter = json['watch_counter'],
        commentCounter = json['comment_counter'],
        createTime = json['create_time'],
        updateTime = json['update_time'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['tags'] = this.tags;
    data['type'] = this.type;
    data['title'] = this.title;
    data['get_counter'] = this.getCounter;
    data['watch_counter'] = this.watchCounter;
    data['comment_counter'] = this.commentCounter;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    return data;
  }
}
