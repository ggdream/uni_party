/// 获取推送视频：请求
class VideoGetReqModel {
  final int number;
  final String? pointer;

  VideoGetReqModel({
    required this.number,
    this.pointer,
  });

  VideoGetReqModel.fromJson(Map<String, dynamic> json)
      : number = json['number'],
        pointer = json['pointer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    if (this.pointer != null) data['pointer'] = this.pointer;
    return data;
  }
}

/// 获取推送视频：响应
class VideoGetResModel {
  late String pointer;
  late bool captcha;
  late List<_Result> result;

  VideoGetResModel({
    required this.pointer,
    required this.captcha,
    required this.result,
  });

  VideoGetResModel.fromJson(Map<String, dynamic> json) {
    pointer = json['pointer'];
    captcha = json['captcha'];
    result = [];
    json['result'].forEach((v) {
      result.add(new _Result.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pointer'] = this.pointer;
    data['captcha'] = this.captcha;
    data['result'] = this.result.map((v) => v.toJson()).toList();
    return data;
  }
}

class _Result {
  final String vid;
  final _Userinfo userinfo;
  final String title;
  final String cover;
  final List<String> tags;
  final String watchCounter;
  final String starCounter;
  final String commentCounter;
  final String collectTime;
  final String createTime;
  final String updateTime;
  final bool isGet;
  final bool isCollect;

  _Result({
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

  _Result.fromJson(Map<String, dynamic> json)
      : vid = json['vid'],
        userinfo = new _Userinfo.fromJson(json['userinfo']),
        title = json['title'],
        cover = json['cover'],
        tags = List<String>.from(json['tags']),
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
