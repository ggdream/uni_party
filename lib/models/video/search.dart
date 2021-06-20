/// 搜索视频：请求
class VideoSearchReqModel {
  final int sortType;
  final String query;
  final int offset;
  final int number;

  VideoSearchReqModel({
    required this.sortType,
    required this.query,
    required this.offset,
    required this.number,
  });

  VideoSearchReqModel.fromJson(Map<String, dynamic> json)
      : sortType = json['sort_type'],
        query = json['query'],
        offset = json['offset'],
        number = json['number'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sort_type'] = this.sortType;
    data['query'] = this.query;
    data['offset'] = this.offset;
    data['number'] = this.number;
    return data;
  }
}

/// 搜索视频：响应
class VideoSearchResModel {
  late String captcha;
  late List<_Result> result;

  VideoSearchResModel({
    required this.captcha,
    required this.result,
  });

  VideoSearchResModel.fromJson(Map<String, dynamic> json) {
    captcha = json['captcha'];
    result = [];
    json['result'].forEach((v) {
      result.add(new _Result.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['captcha'] = this.captcha;
    data['result'] = this.result.map((v) => v.toJson()).toList();
    return data;
  }
}

class _Result {
  late final String vid;
  late final _Userinfo userinfo;
  late final String title;
  late final String cover;
  late final List<String> tags;
  late final String watchCounter;
  late final String starCounter;
  late final String commentCounter;
  late final String collectTime;
  late final String videoCreateTime;
  late final String videoUpdateTime;

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
    required this.videoCreateTime,
    required this.videoUpdateTime,
  });

  _Result.fromJson(Map<String, dynamic> json) {
    vid = json['vid'];
    userinfo = new _Userinfo.fromJson(json['userinfo']);
    title = json['title'];
    cover = json['cover'];
    tags = List<String>.from(json['tags']);
    watchCounter = json['watch_counter'];
    starCounter = json['star_counter'];
    commentCounter = json['comment_counter'];
    collectTime = json['collect_time'];
    videoCreateTime = json['video_create_time'];
    videoUpdateTime = json['video_update_time'];
  }

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
    data['video_create_time'] = this.videoCreateTime;
    data['video_update_time'] = this.videoUpdateTime;
    return data;
  }
}

class _Userinfo {
  final String uid;
  final String uname;
  final String avatar;
  final String motto;
  final String sex;
  final String type;
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
