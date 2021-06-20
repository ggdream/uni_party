/// 获取订阅消息：请求
class EventSubGetReqModel {
  final int offset;
  final int number;

  EventSubGetReqModel({
    required this.offset,
    required this.number,
  });

  EventSubGetReqModel.fromJson(Map<String, dynamic> json)
      : offset = json['offset'],
        number = json['number'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offset'] = this.offset;
    data['number'] = this.number;
    return data;
  }
}

/// 获取订阅消息：响应
class EventSubGetResModel {
  late final String unread;
  late final List<_Events> events;

  EventSubGetResModel({
    required this.unread,
    required this.events,
  });

  EventSubGetResModel.fromJson(Map<String, dynamic> json) {
    unread = json['unread'];
    events = [];
    json['events'].forEach((v) {
      events.add(new _Events.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unread'] = this.unread;
    data['events'] = this.events.map((v) => v.toJson()).toList();
    return data;
  }
}

class _Events {
  late final String eid;
  late final String title;
  late final int type;
  late final List<String> tags;
  late final _UserInfo userInfo;
  late final String createTime;
  late final String updateTime;
  late final int getCounter;
  late final int watchCounter;
  late final int commentCounter;

  _Events({
    required this.eid,
    required this.title,
    required this.type,
    required this.tags,
    required this.userInfo,
    required this.createTime,
    required this.updateTime,
    required this.getCounter,
    required this.watchCounter,
    required this.commentCounter,
  });

  _Events.fromJson(Map<String, dynamic> json) {
    eid = json['eid'];
    title = json['title'];
    type = json['type'];
    tags = List<String>.from(json['tags']);
    userInfo = new _UserInfo.fromJson(json['userinfo']);
    createTime = json['create_time'];
    updateTime = json['update_time'];
    getCounter = json['get_counter'];
    watchCounter = json['watch_counter'];
    commentCounter = json['comment_counter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['type'] = this.type;
    data['tags'] = this.tags;
    data['userinfo'] = this.userInfo.toJson();
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['get_counter'] = this.getCounter;
    data['watch_counter'] = this.watchCounter;
    data['comment_counter'] = this.commentCounter;
    return data;
  }
}

class _UserInfo {
  final String uid;
  final String uname;
  final String avatarUrl;
  final String motto;
  final String sex;
  final int type;
  final String orgName;

  _UserInfo({
    required this.uid,
    required this.uname,
    required this.avatarUrl,
    required this.motto,
    required this.sex,
    required this.type,
    required this.orgName,
  });

  _UserInfo.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        uname = json['uname'],
        avatarUrl = json['avatar_url'],
        motto = json['motto'],
        sex = json['sex'],
        type = json['type'],
        orgName = json['org_name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['uname'] = this.uname;
    data['avatar_url'] = this.avatarUrl;
    data['motto'] = this.motto;
    data['sex'] = this.sex;
    data['type'] = this.type;
    data['org_name'] = this.orgName;
    return data;
  }
}
