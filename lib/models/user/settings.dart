/// 获取当前主题色：请求
class UserSettingsThemeColorGetReqModel {
  UserSettingsThemeColorGetReqModel();

  UserSettingsThemeColorGetReqModel.fromJson();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

/// 获取当前主题色：响应
class UserSettingsThemeColorGetResModel {
  final String color;

  UserSettingsThemeColorGetResModel({
    required this.color,
  });

  UserSettingsThemeColorGetResModel.fromJson(Map<String, dynamic> json)
      : color = json['color'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    return data;
  }
}

/// 设置主题色：请求
class UserSettingsThemeColorSetReqModel {
  final String color;

  UserSettingsThemeColorSetReqModel({
    required this.color,
  });

  UserSettingsThemeColorSetReqModel.fromJson(Map<String, dynamic> json)
      : color = json['color'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    return data;
  }
}

/// 设置主题色：响应
class UserSettingsThemeColorSetResModel {
  UserSettingsThemeColorSetResModel();

  UserSettingsThemeColorSetResModel.fromJson();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

/// 获取邮件推送项：请求
class UserSettingsMailPushGetReqModel {
  UserSettingsMailPushGetReqModel();

  UserSettingsMailPushGetReqModel.fromJson();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

/// 获取邮件推送项：响应
class UserSettingsMailPushGetResModel {
  final bool event;
  final bool video;

  UserSettingsMailPushGetResModel({
    required this.event,
    required this.video,
  });

  UserSettingsMailPushGetResModel.fromJson(Map<String, dynamic> json)
      : event = json['event'],
        video = json['video'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event'] = this.event;
    data['video'] = this.video;
    return data;
  }
}

/// 用户消息推送设置：请求
class UserSettingsMailPushEventSetReqModel {
  final bool status;

  UserSettingsMailPushEventSetReqModel({
    required this.status,
  });

  UserSettingsMailPushEventSetReqModel.fromJson(Map<String, dynamic> json)
      : status = json['status'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}

/// 用户消息推送设置：响应
class UserSettingsMailPushEventSetResModel {
  UserSettingsMailPushEventSetResModel();

  UserSettingsMailPushEventSetResModel.fromJson();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

/// 用户视频推送设置：请求
class UserSettingsMailPushVideoSetReqModel {
  final bool status;

  UserSettingsMailPushVideoSetReqModel({
    required this.status,
  });

  UserSettingsMailPushVideoSetReqModel.fromJson(Map<String, dynamic> json)
      : status = json['status'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}

/// 用户视频推送设置：响应
class UserSettingsMailPushVideoSetResModel {
  UserSettingsMailPushVideoSetResModel();

  UserSettingsMailPushVideoSetResModel.fromJson();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
