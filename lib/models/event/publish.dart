/// 发布消息（通知）：请求
class EventPublishNoticeReqModel {
  final String title;
  final String content;
  final List<String> tags;
  final List<String> files;

  EventPublishNoticeReqModel({
    required this.title,
    required this.content,
    required this.tags,
    required this.files,
  });

  EventPublishNoticeReqModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        tags = List<String>.from(json['tags']),
        files = List<String>.from(json['files']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['tags'] = this.tags;
    data['files'] = this.files;
    return data;
  }
}

/// 发布消息（投票）：请求
class EventPublishVoteReqModel {
  final String title;
  final String content;
  final List<String> tags;
  final int allowedNumber;
  final String deadline;
  final List<String> options;

  EventPublishVoteReqModel({
    required this.title,
    required this.content,
    required this.tags,
    required this.allowedNumber,
    required this.deadline,
    required this.options,
  });

  EventPublishVoteReqModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        tags = List<String>.from(json['tags']),
        allowedNumber = json['allowed_number'],
        deadline = json['deadline'],
        options = List<String>.from(json['options']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['tags'] = this.tags;
    data['allowed_number'] = this.allowedNumber;
    data['deadline'] = this.deadline;
    data['options'] = this.options;
    return data;
  }
}

/// 发布消息（随机）：请求
class EventPublishSortitionReqModel {
  final String title;
  final String content;
  final List<String> tags;
  final int requiredNumber;
  final bool allowedCancel;
  final String deadline;

  EventPublishSortitionReqModel({
    required this.title,
    required this.content,
    required this.tags,
    required this.requiredNumber,
    required this.allowedCancel,
    required this.deadline,
  });

  EventPublishSortitionReqModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        tags = List<String>.from(json['tags']),
        requiredNumber = json['required_number'],
        allowedCancel = json['allowed_cancel'],
        deadline = json['deadline'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['tags'] = this.tags;
    data['required_number'] = this.requiredNumber;
    data['allowed_cancel'] = this.allowedCancel;
    data['deadline'] = this.deadline;
    return data;
  }
}

/// 发布消息（报名）：请求
class EventPublishParticipationReqModel {
  final String title;
  final String content;
  final List<String> tags;
  final int requiredNumber;
  final bool allowedCancel;
  final String deadline;

  EventPublishParticipationReqModel({
    required this.title,
    required this.content,
    required this.tags,
    required this.requiredNumber,
    required this.allowedCancel,
    required this.deadline,
  });

  EventPublishParticipationReqModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        tags = List<String>.from(json['tags']),
        requiredNumber = json['required_number'],
        allowedCancel = json['allowed_cancel'],
        deadline = json['deadline'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['tags'] = this.tags;
    data['required_number'] = this.requiredNumber;
    data['allowed_cancel'] = this.allowedCancel;
    data['deadline'] = this.deadline;
    return data;
  }
}

/// 发布消息：响应
class EventPublishResModel {
  final String eid;
  final int type;

  EventPublishResModel({
    required this.eid,
    required this.type,
  });

  EventPublishResModel.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        type = json['type'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['type'] = this.type;
    return data;
  }
}
