/// 获取用户发布视频：请求
class UserVideoPublicationsGetReqModel {
  final String uid;
  final int offset;
  final int number;

  UserVideoPublicationsGetReqModel({
    required this.uid,
    required this.offset,
    required this.number,
  });

  UserVideoPublicationsGetReqModel.fromJson(Map<String, dynamic> json)
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

/// 获取用户发布视频：响应
class UserVideoPublicationsGetResModel {
  late final int total;
  late final List<_PublishResult> result;

  UserVideoPublicationsGetResModel({
    required this.total,
    required this.result,
  });

  UserVideoPublicationsGetResModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    result = [];
    json['result'].forEach((v) {
      result.add(new _PublishResult.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['result'] = this.result.map((v) => v.toJson()).toList();
    return data;
  }
}

class _PublishResult {
  final String vid;
  final String title;
  final String cover;
  final List<String> tags;
  final int watchCounter;
  final int starCounter;
  final int commentCounter;
  final String createTime;
  final String updateTime;
  final bool isGet;
  final bool isCollect;

  _PublishResult({
    required this.vid,
    required this.title,
    required this.cover,
    required this.tags,
    required this.watchCounter,
    required this.starCounter,
    required this.commentCounter,
    required this.createTime,
    required this.updateTime,
    required this.isGet,
    required this.isCollect,
  });

  _PublishResult.fromJson(Map<String, dynamic> json)
      : vid = json['vid'],
        title = json['title'],
        cover = json['cover'],
        tags = List<String>.from(['tags']),
        watchCounter = json['watch_counter'],
        starCounter = json['star_counter'],
        commentCounter = json['comment_counter'],
        createTime = json['create_time'],
        updateTime = json['update_time'],
        isGet = json['is_get'],
        isCollect = json['is_collect'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    data['title'] = this.title;
    data['cover'] = this.cover;
    data['tags'] = this.tags;
    data['watch_counter'] = this.watchCounter;
    data['star_counter'] = this.starCounter;
    data['comment_counter'] = this.commentCounter;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['is_get'] = this.isGet;
    data['is_collect'] = this.isCollect;
    return data;
  }
}

/// 用户收藏视频：请求
class UserVideoCollectionsGetReqModel {
  final String uid;
  final int offset;
  final int number;

  UserVideoCollectionsGetReqModel({
    required this.uid,
    required this.offset,
    required this.number,
  });

  UserVideoCollectionsGetReqModel.fromJson(Map<String, dynamic> json)
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

/// 获取用户收藏视频：响应
class UserVideoCollectionsGetResModel {
  late final int total;
  late final List<_CollectResult> result;

  UserVideoCollectionsGetResModel({
    required this.total,
    required this.result,
  });

  UserVideoCollectionsGetResModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    result = [];
    json['result'].forEach((v) {
      result.add(new _CollectResult.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['result'] = this.result.map((v) => v.toJson()).toList();
    return data;
  }
}

class _CollectResult {
  final String vid;
  final _Userinfo userinfo;
  final String title;
  final String cover;
  final List<String> tags;
  final int watchCounter;
  final int starCounter;
  final int commentCounter;
  final String collectTime;
  final String createTime;
  final String updateTime;
  final bool isGet;
  final bool isCollect;

  _CollectResult({
    required this.vid,
    required this.userinfo,
    required this.title,
    required this.cover,
    required this.tags,
    required this.watchCounter,
    required this.starCounter,
    required this.commentCounter,
    required this.collectTime,
    required this.createTime,
    required this.updateTime,
    required this.isGet,
    required this.isCollect,
  });

  _CollectResult.fromJson(Map<String, dynamic> json)
      : vid = json['vid'],
        userinfo = new _Userinfo.fromJson(json['userinfo']),
        title = json['title'],
        cover = json['cover'],
        tags = json['tags'].cast<String>(),
        watchCounter = json['watch_counter'],
        starCounter = json['star_counter'],
        commentCounter = json['comment_counter'],
        collectTime = json['collect_time'],
        createTime = json['create_time'],
        updateTime = json['update_time'],
        isGet = json['is_get'],
        isCollect = json['is_collect'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    data['userinfo'] = this.userinfo.toJson();
    data['title'] = this.title;
    data['cover'] = this.cover;
    data['tags'] = this.tags;
    data['watch_counter'] = this.watchCounter;
    data['star_counter'] = this.starCounter;
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
