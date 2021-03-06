/// 获取关注信息：请求
class UserFollowingGetReqModel {
  final String uid;
  final int offset;
  final int number;

  UserFollowingGetReqModel({
    required this.uid,
    required this.offset,
    required this.number,
  });

  UserFollowingGetReqModel.fromJson(Map<String, dynamic> json)
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

/// 获取关注信息：响应
class UserFollowingGetResModel {
  late final int total;
  late final List<_Users> users;

  UserFollowingGetResModel({
    required this.total,
    required this.users,
  });

  UserFollowingGetResModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    users = [];
    json['users'].forEach((v) {
      users.add(new _Users.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['users'] = this.users.map((v) => v.toJson()).toList();
    return data;
  }
}

class _Users {
  final int uid;
  final String uname;
  final String avatar;
  final String sex;
  final String motto;
  final int type;
  final String orgName;

  _Users({
    required this.uid,
    required this.uname,
    required this.avatar,
    required this.sex,
    required this.motto,
    required this.type,
    required this.orgName,
  });

  _Users.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        uname = json['uname'],
        avatar = json['avatar'],
        sex = json['sex'],
        motto = json['motto'],
        type = json['type'],
        orgName = json['org_name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['uname'] = this.uname;
    data['avatar'] = this.avatar;
    data['sex'] = this.sex;
    data['motto'] = this.motto;
    data['type'] = this.type;
    data['org_name'] = this.orgName;
    return data;
  }
}

/// 添加或取消关注：请求
class UserFollowingActionReqModel {
  final String uid;
  final int type;

  UserFollowingActionReqModel({
    required this.uid,
    required this.type,
  });

  UserFollowingActionReqModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        type = json['type'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['type'] = this.type;
    return data;
  }
}

/// 添加或取消关注：响应
class UserFollowingActionResModel {
  UserFollowingActionResModel();

  UserFollowingActionResModel.fromJson();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
