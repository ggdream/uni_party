/// 获取用户收藏的消息：请求
class EventCollectionsGetReqModel {
  final String uid;
  final int offset;
  final int number;

  EventCollectionsGetReqModel({
    required this.uid,
    required this.offset,
    required this.number,
  });

  EventCollectionsGetReqModel.fromJson(Map<String, dynamic> json)
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

/// 获取用户收藏的消息：响应
class EventCollectionsGetResModel {
  late final int total;
  late final List<_Result> result;

  EventCollectionsGetResModel({
    required this.total,
    required this.result,
  });

  EventCollectionsGetResModel.fromJson(Map<String, dynamic> json) {
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
  final String eid;
  final String title;
  final int types;
  final List<String> tags;
  final _Userinfo userinfo;
  final int getCounter;
  final int watchCounter;
  final int commentCounter;
  final String collectTime;
  final String eventCreateTime;
  final String eventUpdateTime;

  _Result({
    required this.eid,
    required this.title,
    required this.types,
    required this.tags,
    required this.userinfo,
    required this.getCounter,
    required this.watchCounter,
    required this.commentCounter,
    required this.collectTime,
    required this.eventCreateTime,
    required this.eventUpdateTime,
  });

  _Result.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        title = json['title'],
        types = json['types'],
        tags = List<String>.from(json['tags']),
        userinfo = new _Userinfo.fromJson(json['userinfo']),
        getCounter = json['get_counter'],
        watchCounter = json['watch_counter'],
        commentCounter = json['comment_counter'],
        collectTime = json['collect_time'],
        eventCreateTime = json['event_create_time'],
        eventUpdateTime = json['event_update_time'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['types'] = this.types;
    data['tags'] = this.tags;
    data['userinfo'] = this.userinfo.toJson();
    data['get_counter'] = this.getCounter;
    data['watch_counter'] = this.watchCounter;
    data['comment_counter'] = this.commentCounter;
    data['collect_time'] = this.collectTime;
    data['event_create_time'] = this.eventCreateTime;
    data['event_update_time'] = this.eventUpdateTime;
    return data;
  }
}

class _Userinfo {
  final String uid;
  final String uname;
  final String avatar;
  final String motto;
  final String sex;
  final int type;
  final String orgName;

  _Userinfo({
    required this.uid,
    required this.uname,
    required this.avatar,
    required this.motto,
    required this.sex,
    required this.type,
    required this.orgName,
  });

  _Userinfo.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        uname = json['uname'],
        avatar = json['avatar'],
        motto = json['motto'],
        sex = json['sex'],
        type = json['type'],
        orgName = json['org_name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['uname'] = this.uname;
    data['avatar'] = this.avatar;
    data['motto'] = this.motto;
    data['sex'] = this.sex;
    data['type'] = this.type;
    data['org_name'] = this.orgName;
    return data;
  }
}
