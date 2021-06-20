/// 搜索消息：请求
class EventSearchReqModel {
  final int type;
  final String startTime;
  final String endTime;
  final String query;

  EventSearchReqModel({
    required this.type,
    required this.startTime,
    required this.endTime,
    required this.query,
  });

  EventSearchReqModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        startTime = json['start_time'],
        endTime = json['end_time'],
        query = json['query'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['query'] = this.query;
    return data;
  }
}

/// 搜索消息：响应
class EventSearchResModel {
  late final int total;
  late final List<_Match> match;

  EventSearchResModel({
  required  this.total,
  required  this.match,
  });

  EventSearchResModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    match = [];
    json['match'].forEach((v) {
      match.add(new _Match.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['match'] = this.match.map((v) => v.toJson()).toList();
    return data;
  }
}

class _Match {
  final String eid;
  final String title;
  final int type;
  final List<String> tags;
  final _Userinfo userinfo;
  final String createTime;
  final String updateTime;
  final int getCounter;
  final int watchCounter;
  final int commentCounter;

  _Match({
    required this.eid,
    required this.title,
    required this.type,
    required this.tags,
    required this.userinfo,
    required this.createTime,
    required this.updateTime,
    required this.getCounter,
    required this.watchCounter,
    required this.commentCounter,
  });

  _Match.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        title = json['title'],
        type = json['type'],
        tags = List<String>.from(json['tags']),
        userinfo = new _Userinfo.fromJson(json['userinfo']),
        createTime = json['create_time'],
        updateTime = json['update_time'],
        getCounter = json['get_counter'],
        watchCounter = json['watch_counter'],
        commentCounter = json['comment_counter'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['type'] = this.type;
    data['tags'] = this.tags;
    data['userinfo'] = this.userinfo.toJson();
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['get_counter'] = this.getCounter;
    data['watch_counter'] = this.watchCounter;
    data['comment_counter'] = this.commentCounter;
    return data;
  }
}

class _Userinfo {
  final String uid;
  final String uname;
  final String avatarUrl;
  final String motto;
  final String sex;
  final int types;
  final String orgName;

  _Userinfo({
    required this.uid,
    required this.uname,
    required this.avatarUrl,
    required this.motto,
    required this.sex,
    required this.types,
    required this.orgName,
  });

  _Userinfo.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        uname = json['uname'],
        avatarUrl = json['avatar_url'],
        motto = json['motto'],
        sex = json['sex'],
        types = json['types'],
        orgName = json['org_name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['uname'] = this.uname;
    data['avatar_url'] = this.avatarUrl;
    data['motto'] = this.motto;
    data['sex'] = this.sex;
    data['types'] = this.types;
    data['org_name'] = this.orgName;
    return data;
  }
}
