/// 修改消息（通知）：请求
class EventRepairNoticeReqModel {
  final String eid;
  final String title;
  final String content;
  final List<String> tags;
  final List<String> files;

  EventRepairNoticeReqModel({
    required this.eid,
    required this.title,
    required this.content,
    required this.tags,
    required this.files,
  });

  EventRepairNoticeReqModel.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        title = json['title'],
        content = json['content'],
        tags = List<String>.from(json['tags']),
        files = List<String>.from(json['files']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['tags'] = this.tags;
    data['files'] = this.files;
    return data;
  }
}

/// 修改消息（投票）：请求
class EventRepairVoteReqModel {
  final String eid;
  final String title;
  final String content;
  final List<String> tags;
  final int allowedNumber;
  final String deadline;
  final List<String> options;

  EventRepairVoteReqModel({
    required this.eid,
    required this.title,
    required this.content,
    required this.tags,
    required this.allowedNumber,
    required this.deadline,
    required this.options,
  });

  EventRepairVoteReqModel.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        title = json['title'],
        content = json['content'],
        tags = List<String>.from(json['tags']),
        allowedNumber = json['allowed_number'],
        deadline = json['deadline'],
        options = List<String>.from(json['options']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['tags'] = this.tags;
    data['allowed_number'] = this.allowedNumber;
    data['deadline'] = this.deadline;
    data['options'] = this.options;
    return data;
  }
}

/// 修改消息（随机）：请求
class EventRepairSortitionReqModel {
  final String eid;
  final String title;
  final String content;
  final List<String> tags;
  final int requiredNumber;
  final bool allowedCancel;
  final String deadline;

  EventRepairSortitionReqModel({
    required this.eid,
    required this.title,
    required this.content,
    required this.tags,
    required this.requiredNumber,
    required this.allowedCancel,
    required this.deadline,
  });

  EventRepairSortitionReqModel.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        title = json['title'],
        content = json['content'],
        tags = List<String>.from(json['tags']),
        requiredNumber = json['required_number'],
        allowedCancel = json['allowed_cancel'],
        deadline = json['deadline'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['tags'] = this.tags;
    data['required_number'] = this.requiredNumber;
    data['allowed_cancel'] = this.allowedCancel;
    data['deadline'] = this.deadline;
    return data;
  }
}

/// 修改消息（报名）：请求
class EventRepairParticipationReqModel {
  final String eid;
  final String title;
  final String content;
  final List<String> tags;
  final int requiredNumber;
  final bool allowedCancel;
  final String deadline;

  EventRepairParticipationReqModel({
    required this.eid,
    required this.title,
    required this.content,
    required this.tags,
    required this.requiredNumber,
    required this.allowedCancel,
    required this.deadline,
  });

  EventRepairParticipationReqModel.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        title = json['title'],
        content = json['content'],
        tags = List<String>.from(json['tags']),
        requiredNumber = json['required_number'],
        allowedCancel = json['allowed_cancel'],
        deadline = json['deadline'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['tags'] = this.tags;
    data['required_number'] = this.requiredNumber;
    data['allowed_cancel'] = this.allowedCancel;
    data['deadline'] = this.deadline;
    return data;
  }
}

/// 修改消息：响应
class EventRepairResModel {
  final String eid;
  final int frequency;

  EventRepairResModel({
    required this.eid,
    required this.frequency,
  });

  EventRepairResModel.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        frequency = json['frequency'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['frequency'] = this.frequency;
    return data;
  }
}
