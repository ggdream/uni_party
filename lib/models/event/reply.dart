/// 添加评论：请求
class EventArchiveReplyAddReqModel {
  final String vid;
  final String? root;
  final String? parent;
  final String message;

  EventArchiveReplyAddReqModel({
    required this.vid,
    required this.message,
    this.root,
    this.parent,
  });

  EventArchiveReplyAddReqModel.fromJson(Map<String, dynamic> json)
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
class EventArchiveReplyAddResModel {
  final String rid;
  final String message;
  final String datetime;
  final bool needCaptcha;

  EventArchiveReplyAddResModel({
    required this.rid,
    required this.message,
    required this.datetime,
    required this.needCaptcha,
  });

  EventArchiveReplyAddResModel.fromJson(Map<String, dynamic> json)
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
class EventArchiveReplyDelReqModel {
  final String vid;
  final String rid;

  EventArchiveReplyDelReqModel({
    required this.vid,
    required this.rid,
  });

  EventArchiveReplyDelReqModel.fromJson(Map<String, dynamic> json)
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
class EventArchiveReplyDelResModel {
  final bool needCaptcha;

  EventArchiveReplyDelResModel({
    required this.needCaptcha,
  });

  EventArchiveReplyDelResModel.fromJson(Map<String, dynamic> json)
      : needCaptcha = json['need_captcha'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['need_captcha'] = this.needCaptcha;
    return data;
  }
}
