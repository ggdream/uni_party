/// 获取用户发布的消息：请求
class UserEventPublicationsGetReqModel {
  final String uid;
  final int offset;
  final int number;

  UserEventPublicationsGetReqModel({
    required this.uid,
    required this.offset,
    required this.number,
  });

  UserEventPublicationsGetReqModel.fromJson(Map<String, dynamic> json)
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
class UserEventPublicationsGetResModel {
  late final int total;
  late final List<_Event> events;

  UserEventPublicationsGetResModel({
    required this.total,
    required this.events,
  });

  UserEventPublicationsGetResModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    events = [];
    json['events'].forEach((v) {
      events.add(new _Event.fromJson(v));
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
class UserEventCollectionsGetReqModel {
  final String uid;
  final int offset;
  final int number;

  UserEventCollectionsGetReqModel({
    required this.uid,
    required this.offset,
    required this.number,
  });

  UserEventCollectionsGetReqModel.fromJson(Map<String, dynamic> json)
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
class UserEventCollectionsGetResModel {
  late final int total;
  late final List<_Result> events;

  UserEventCollectionsGetResModel({
    required this.total,
    required this.events,
  });

  UserEventCollectionsGetResModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['events'] != null) {
      events = [];
      json['events'].forEach((v) {
        events.add(new _Result.fromJson(v));
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

class _Event {
  final String eid;
  final List<String> tags;
  final int type;
  final String title;
  final int getCounter;
  final int watchCounter;
  final int commentCounter;
  final String createTime;
  final String updateTime;
  final String isGet;
  final String isCollect;

  _Event({
    required this.eid,
    required this.tags,
    required this.type,
    required this.title,
    required this.getCounter,
    required this.watchCounter,
    required this.commentCounter,
    required this.createTime,
    required this.updateTime,
    required this.isGet,
    required this.isCollect,
  });

  _Event.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        tags = List<String>.from(json['tags']),
        type = json['type'],
        title = json['title'],
        getCounter = json['get_counter'],
        watchCounter = json['watch_counter'],
        commentCounter = json['comment_counter'],
        createTime = json['create_time'],
        updateTime = json['update_time'],
        isGet = json['is_get'],
        isCollect = json['is_collect'];

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
    data['is_get'] = this.isGet;
    data['is_collect'] = this.isCollect;
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
  final String createTime;
  final String updateTime;
  final bool isGet;
  final bool isCollect;

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
    required this.createTime,
    required this.updateTime,
    required this.isGet,
    required this.isCollect,
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
        createTime = json['create_time'],
        updateTime = json['update_time'],
        isGet = json['is_get'],
        isCollect = json['is_collect'];

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
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['is_get'] = this.isGet;
    data['is_collect'] = this.isCollect;
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
