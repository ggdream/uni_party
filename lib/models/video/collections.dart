/// 用户收藏视频：请求
class VideoCollectionsGetReqModel {
  final String uid;
  final int offset;
  final int number;

  VideoCollectionsGetReqModel({
    required this.uid,
    required this.offset,
    required this.number,
  });

  VideoCollectionsGetReqModel.fromJson(Map<String, dynamic> json)
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
class VideoCollectionsGetResModel {
  late final int total;
  late final List<_Result> result;

  VideoCollectionsGetResModel({
    required this.total,
    required this.result,
  });

  VideoCollectionsGetResModel.fromJson(Map<String, dynamic> json) {
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
  late final String vid;
  late final _Userinfo userinfo;
  late final String title;
  late final String cover;
  late final List<String> tags;
  late final int watchCounter;
  late final int starCounter;
  late final int commentCounter;
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
    tags = json['tags'].cast<String>();
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
