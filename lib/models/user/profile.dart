/// 获取用户信息: 请求
class UserInfoGetReqModel {
  final String uid;

  UserInfoGetReqModel({
    required this.uid,
  });

  UserInfoGetReqModel.fromJson(Map<String, dynamic> json) : uid = json['uid'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = uid;
    return data;
  }
}

/// 获取用户信息: 响应
class UserInfoGetResModel {
  final int uid;
  final String uname;
  final String birthday;
  final String sex;
  final String avatar;
  final String motto;
  final int level;
  final int subLevel;
  final int type;
  final String orgName;
  final int followers;
  final int following;
  final int eventCounter;
  final int videoCounter;

  UserInfoGetResModel({
    required this.uid,
    required this.uname,
    required this.birthday,
    required this.sex,
    required this.avatar,
    required this.motto,
    required this.level,
    required this.subLevel,
    required this.type,
    required this.orgName,
    required this.followers,
    required this.following,
    required this.eventCounter,
    required this.videoCounter,
  });

  UserInfoGetResModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        uname = json['uname'],
        birthday = json['birthday'],
        sex = json['sex'],
        avatar = json['avatar'],
        motto = json['motto'],
        level = json['level'],
        subLevel = json['sub_level'],
        type = json['type'],
        orgName = json['org_name'],
        followers = json['followers'],
        following = json['following'],
        eventCounter = json['event_counter'],
        videoCounter = json['video_counter'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['uname'] = this.uname;
    data['birthday'] = this.birthday;
    data['sex'] = this.sex;
    data['avatar'] = this.avatar;
    data['motto'] = this.motto;
    data['level'] = this.level;
    data['sub_level'] = this.subLevel;
    data['type'] = this.type;
    data['org_name'] = this.orgName;
    data['followers'] = this.followers;
    data['following'] = this.following;
    data['event_counter'] = this.eventCounter;
    data['video_counter'] = this.videoCounter;
    return data;
  }
}

/// 更新个人信息：请求
class UserInfoUpdateReqModel {
  final String uname;
  final String birthday;
  final String sex;
  final String motto;

  UserInfoUpdateReqModel({
    required this.uname,
    required this.birthday,
    required this.sex,
    required this.motto,
  });

  UserInfoUpdateReqModel.fromJson(Map<String, dynamic> json)
      : uname = json['uname'],
        birthday = json['birthday'],
        sex = json['sex'],
        motto = json['motto'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uname'] = this.uname;
    data['birthday'] = this.birthday;
    data['sex'] = this.sex;
    data['motto'] = this.motto;
    return data;
  }
}

/// 更新个人信息：响应
class UserInfoUpdateResModel {
  UserInfoUpdateResModel();
  UserInfoUpdateResModel.fromJson();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
