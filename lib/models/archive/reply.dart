/// 添加评论：请求
class ArchiveReplyAddReqModel {
  final String vid;
  final String? root;
  final String? parent;
  final String message;

  ArchiveReplyAddReqModel({
    required this.vid,
    required this.message,
    this.root,
    this.parent,
  });

  ArchiveReplyAddReqModel.fromJson(Map<String, dynamic> json)
      : vid = json['vid'],
        root = json['root'],
        parent = json['parent'],
        message = json['message'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    data['root'] = this.root;
    data['parent'] = this.parent;
    data['message'] = this.message;
    return data;
  }
}

/// 添加评论：响应
class ArchiveReplyAddResModel {
  final String rid;
  final String message;
  final String datetime;
  final bool needCaptcha;

  ArchiveReplyAddResModel({
    required this.rid,
    required this.message,
    required this.datetime,
    required this.needCaptcha,
  });

  ArchiveReplyAddResModel.fromJson(Map<String, dynamic> json)
      : rid = json['rid'],
        message = json['message'],
        datetime = json['datetime'],
        needCaptcha = json['need_captcha'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rid'] = this.rid;
    data['message'] = this.message;
    data['datetime'] = this.datetime;
    data['need_captcha'] = this.needCaptcha;
    return data;
  }
}

/// 删除评论：请求
class ArchiveReplyDelReqModel {
  final String vid;
  final String rid;

  ArchiveReplyDelReqModel({
    required this.vid,
    required this.rid,
  });

  ArchiveReplyDelReqModel.fromJson(Map<String, dynamic> json)
      : vid = json['vid'],
        rid = json['rid'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    data['rid'] = this.rid;
    return data;
  }
}

/// 删除评论：响应
class ArchiveReplyDelResModel {
  final bool needCaptcha;

  ArchiveReplyDelResModel({
    required this.needCaptcha,
  });

  ArchiveReplyDelResModel.fromJson(Map<String, dynamic> json)
      : needCaptcha = json['need_captcha'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['need_captcha'] = this.needCaptcha;
    return data;
  }
}
