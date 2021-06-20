/// 搜索用户：请求
class UserSearchReqModel {
  final int type;
  final String query;

  UserSearchReqModel({
    required this.type,
    required this.query,
  });

  UserSearchReqModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        query = json['query'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['query'] = this.query;
    return data;
  }
}

/// 搜索用户：响应
class UserSearchResModel {
  late final int total;
  late final List<_Match> match;

  UserSearchResModel({
    required this.total,
    required this.match,
  });

  UserSearchResModel.fromJson(Map<String, dynamic> json) {
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
  final int uid;
  final String uname;
  final String avatar;
  final String motto;
  final String sex;
  final int type;
  final String orgName;

  _Match({
    required this.uid,
    required this.uname,
    required this.avatar,
    required this.motto,
    required this.sex,
    required this.type,
    required this.orgName,
  });

  _Match.fromJson(Map<String, dynamic> json)
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
