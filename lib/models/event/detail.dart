/// 获取消息详情：请求
class EventDetailGetReqModel {
  final int type;
  final String eid;

  EventDetailGetReqModel({
    required this.type,
    required this.eid,
  });

  EventDetailGetReqModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        eid = json['eid'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['eid'] = this.eid;
    return data;
  }
}

/// 获取消息详情（通知）：响应
class EventDetailGetNoticeResModel {
  final String eid;
  final String title;
  final String content;
  final int type;
  final List<String> tags;
  final String createTime;
  final String updateTime;
  final int getCounter;
  final int watchCounter;
  final int commentCounter;
  final bool isGet;
  final _NoticeEventDetail eventDetail;
  final _Userinfo userinfo;

  EventDetailGetNoticeResModel({
    required this.eid,
    required this.title,
    required this.content,
    required this.type,
    required this.tags,
    required this.createTime,
    required this.updateTime,
    required this.getCounter,
    required this.watchCounter,
    required this.commentCounter,
    required this.isGet,
    required this.eventDetail,
    required this.userinfo,
  });

  EventDetailGetNoticeResModel.fromJson(Map<String, dynamic> json) :
    eid = json['eid'],
    title = json['title'],
    content = json['content'],
    type = json['type'],
    tags = json['tags'].cast<String>(),
    createTime = json['create_time'],
    updateTime = json['update_time'],
    getCounter = json['get_counter'],
    watchCounter = json['watch_counter'],
    commentCounter = json['comment_counter'],
    isGet = json['is_get'],
    eventDetail = new _NoticeEventDetail.fromJson(json['event_detail']),
    userinfo = new _Userinfo.fromJson(json['userinfo']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['type'] = this.type;
    data['tags'] = this.tags;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['get_counter'] = this.getCounter;
    data['watch_counter'] = this.watchCounter;
    data['comment_counter'] = this.commentCounter;
    data['is_get'] = this.isGet;
    data['event_detail'] = this.eventDetail.toJson();
    data['userinfo'] = this.userinfo.toJson();
    return data;
  }
}

class _NoticeEventDetail {
  late final List<_Files> files;

  _NoticeEventDetail({
    required this.files,
  });

  _NoticeEventDetail.fromJson(Map<String, dynamic> json) {
    files = [];
    json['files'].forEach((v) {
      files.add(new _Files.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['files'] = this.files.map((v) => v.toJson()).toList();
    return data;
  }
}

class _Files {
  final String name;
  final String type;
  final String location;

  _Files({
    required this.name,
    required this.type,
    required this.location,
  });

  _Files.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        type = json['type'],
        location = json['location'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['location'] = this.location;
    return data;
  }
}

/// 获取消息详情（投票）：响应
class EventDetailGetVoteResModel {
  final String eid;
  final String title;
  final String content;
  final int type;
  final List<String> tags;
  final String createTime;
  final String updateTime;
  final int getCounter;
  final int watchCounter;
  final int commentCounter;
  final bool isGet;
  final _VoteEventDetail eventDetail;
  final _Userinfo userinfo;

  EventDetailGetVoteResModel({
    required this.eid,
    required this.title,
    required this.content,
    required this.type,
    required this.tags,
    required this.createTime,
    required this.updateTime,
    required this.getCounter,
    required this.watchCounter,
    required this.commentCounter,
    required this.isGet,
    required this.eventDetail,
    required this.userinfo,
  });

  EventDetailGetVoteResModel.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        title = json['title'],
        content = json['content'],
        type = json['type'],
        tags = List<String>.from(json['tags']),
        createTime = json['create_time'],
        updateTime = json['update_time'],
        getCounter = json['get_counter'],
        watchCounter = json['watch_counter'],
        commentCounter = json['comment_counter'],
        isGet = json['is_get'],
        eventDetail = new _VoteEventDetail.fromJson(json['event_detail']),
        userinfo = new _Userinfo.fromJson(json['userinfo']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['type'] = this.type;
    data['tags'] = this.tags;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['get_counter'] = this.getCounter;
    data['watch_counter'] = this.watchCounter;
    data['comment_counter'] = this.commentCounter;
    data['is_get'] = this.isGet;
    data['event_detail'] = this.eventDetail.toJson();
    data['userinfo'] = this.userinfo.toJson();
    return data;
  }
}

class _VoteEventDetail {
  final bool multiple;
  final int allowedNumber;
  final bool isOver;
  final String deadline;
  final List<String> options;
  final int participatedNumber;
  final bool isParticipated;
  final List<int> selectedNo;
  final List<int> result;

  _VoteEventDetail({
    required this.multiple,
    required this.allowedNumber,
    required this.isOver,
    required this.deadline,
    required this.options,
    required this.participatedNumber,
    required this.isParticipated,
    required this.selectedNo,
    required this.result,
  });

  _VoteEventDetail.fromJson(Map<String, dynamic> json)
      : multiple = json['multiple'],
        allowedNumber = json['allowed_number'],
        isOver = json['is_over'],
        deadline = json['deadline'],
        options = List<String>.from(json['options']),
        participatedNumber = json['participated_number'],
        isParticipated = json['is_participated'],
        selectedNo = List<int>.from(json['selected_no']),
        result = List<int>.from(json['result']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['multiple'] = this.multiple;
    data['allowed_number'] = this.allowedNumber;
    data['is_over'] = this.isOver;
    data['deadline'] = this.deadline;
    data['options'] = this.options;
    data['participated_number'] = this.participatedNumber;
    data['is_participated'] = this.isParticipated;
    data['selected_no'] = this.selectedNo;
    data['result'] = this.result;
    return data;
  }
}


/// 获取消息详情（随机）：响应
class EventDetailGetSortitionResModel {
  final String eid;
  final String title;
  final String content;
  final int type;
  final List<String> tags;
  final String createTime;
  final String updateTime;
  final int getCounter;
  final int watchCounter;
  final int commentCounter;
  final bool isGet;
  final _SortitionEventDetail eventDetail;
  final _Userinfo userinfo;

  EventDetailGetSortitionResModel({
    required this.eid,
    required this.title,
    required this.content,
    required this.type,
    required this.tags,
    required this.createTime,
    required this.updateTime,
    required this.getCounter,
    required this.watchCounter,
    required this.commentCounter,
    required this.isGet,
    required this.eventDetail,
    required this.userinfo,
  });

  EventDetailGetSortitionResModel.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        title = json['title'],
        content = json['content'],
        type = json['type'],
        tags = List<String>.from(json['tags']),
        createTime = json['create_time'],
        updateTime = json['update_time'],
        getCounter = json['get_counter'],
        watchCounter = json['watch_counter'],
        commentCounter = json['comment_counter'],
        isGet = json['is_get'],
        eventDetail = new _SortitionEventDetail.fromJson(json['event_detail']),
        userinfo = new _Userinfo.fromJson(json['userinfo']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['type'] = this.type;
    data['tags'] = this.tags;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['get_counter'] = this.getCounter;
    data['watch_counter'] = this.watchCounter;
    data['comment_counter'] = this.commentCounter;
    data['is_get'] = this.isGet;
    data['event_detail'] = this.eventDetail.toJson();
    data['userinfo'] = this.userinfo.toJson();
    return data;
  }
}

class _SortitionEventDetail {
  final int requiredNumber;
  final bool allowedCancel;
  final bool isOver;
  final String deadline;
  final bool isParticipated;
  final bool isSelected;
  final int participatedNumber;
  final List<int> result;

  _SortitionEventDetail({
    required this.requiredNumber,
    required this.allowedCancel,
    required this.isOver,
    required this.deadline,
    required this.isParticipated,
    required this.isSelected,
    required this.participatedNumber,
    required this.result,
  });

  _SortitionEventDetail.fromJson(Map<String, dynamic> json)
      : requiredNumber = json['required_number'],
        allowedCancel = json['allowed_cancel'],
        isOver = json['is_over'],
        deadline = json['deadline'],
        isParticipated = json['is_participated'],
        isSelected = json['is_selected'],
        participatedNumber = json['participated_number'],
        result = List<int>.from(json['result']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['required_number'] = this.requiredNumber;
    data['allowed_cancel'] = this.allowedCancel;
    data['is_over'] = this.isOver;
    data['deadline'] = this.deadline;
    data['is_participated'] = this.isParticipated;
    data['is_selected'] = this.isSelected;
    data['participated_number'] = this.participatedNumber;
    data['result'] = this.result;
    return data;
  }
}


/// 获取消息详情（报名）：响应
class EventDetailGetParticipationResModel {
  final String eid;
  final String title;
  final String content;
  final int type;
  final List<String> tags;
  final String createTime;
  final String updateTime;
  final int getCounter;
  final int watchCounter;
  final int commentCounter;
  final bool isGet;
  final _ParticipationEventDetail eventDetail;
  final _Userinfo userinfo;

  EventDetailGetParticipationResModel({
    required this.eid,
    required this.title,
    required this.content,
    required this.type,
    required this.tags,
    required this.createTime,
    required this.updateTime,
    required this.getCounter,
    required this.watchCounter,
    required this.commentCounter,
    required this.isGet,
    required this.eventDetail,
    required this.userinfo,
  });

  EventDetailGetParticipationResModel.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        title = json['title'],
        content = json['content'],
        type = json['type'],
        tags = List<String>.from(json['tags']),
        createTime = json['create_time'],
        updateTime = json['update_time'],
        getCounter = json['get_counter'],
        watchCounter = json['watch_counter'],
        commentCounter = json['comment_counter'],
        isGet = json['is_get'],
        eventDetail = new _ParticipationEventDetail.fromJson(json['event_detail']),
        userinfo = new _Userinfo.fromJson(json['userinfo']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['type'] = this.type;
    data['tags'] = this.tags;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['get_counter'] = this.getCounter;
    data['watch_counter'] = this.watchCounter;
    data['comment_counter'] = this.commentCounter;
    data['is_get'] = this.isGet;
    data['event_detail'] = this.eventDetail.toJson();
    data['userinfo'] = this.userinfo.toJson();
    return data;
  }
}

class _ParticipationEventDetail {
  final int requiredNumber;
  final bool allowedCancel;
  final bool isOver;
  final String deadline;
  final bool isParticipated;
  final int participatedNumber;
  final List<int> result;

  _ParticipationEventDetail({
    required this.requiredNumber,
    required this.allowedCancel,
    required this.isOver,
    required this.deadline,
    required this.isParticipated,
    required this.participatedNumber,
    required this.result,
  });

  _ParticipationEventDetail.fromJson(Map<String, dynamic> json)
      : requiredNumber = json['required_number'],
        allowedCancel = json['allowed_cancel'],
        isOver = json['is_over'],
        deadline = json['deadline'],
        isParticipated = json['is_participated'],
        participatedNumber = json['participated_number'],
        result = List<int>.from(json['result']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['required_number'] = this.requiredNumber;
    data['allowed_cancel'] = this.allowedCancel;
    data['is_over'] = this.isOver;
    data['deadline'] = this.deadline;
    data['is_participated'] = this.isParticipated;
    data['participated_number'] = this.participatedNumber;
    data['result'] = this.result;
    return data;
  }
}




class _Userinfo {
  String uid;
  String uname;
  String avatarUrl;
  String motto;
  String sex;
  int type;
  String orgName;

  _Userinfo({
    required this.uid,
    required this.uname,
    required this.avatarUrl,
    required this.motto,
    required this.sex,
    required this.type,
    required this.orgName,
  });

  _Userinfo.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        uname = json['uname'],
        avatarUrl = json['avatar_url'],
        motto = json['motto'],
        sex = json['sex'],
        type = json['type'],
        orgName = json['org_name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['uname'] = this.uname;
    data['avatar_url'] = this.avatarUrl;
    data['motto'] = this.motto;
    data['sex'] = this.sex;
    data['type'] = this.type;
    data['org_name'] = this.orgName;
    return data;
  }
}
