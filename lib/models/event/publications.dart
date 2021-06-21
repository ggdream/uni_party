/// 获取用户发表的消息：请求
class EventPublicationsGetReqModel {
  final String uid;
  final int offset;
  final int number;

  EventPublicationsGetReqModel({
    required this.uid,
    required this.offset,
    required this.number,
  });

  EventPublicationsGetReqModel.fromJson(Map<String, dynamic> json)
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

/// 获取用户发表的消息：响应
class EventPublicationsGetResModel {
  late int total;
  late List<_Result> result;

  EventPublicationsGetResModel({
    required this.total,
    required this.result,
  });

  EventPublicationsGetResModel.fromJson(Map<String, dynamic> json) {
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
  final String eid;
  final String title;
  final List<String> tags;
  final int watchCounter;
  final int starCounter;
  final int commentCounter;
  final String createTime;
  final String updateTime;
  final bool isGet;
  final bool isCollect;

  _Result({
    required this.eid,
    required this.title,
    required this.tags,
    required this.watchCounter,
    required this.starCounter,
    required this.commentCounter,
    required this.createTime,
    required this.updateTime,
    required this.isGet,
    required this.isCollect,
  });

  _Result.fromJson(Map<String, dynamic> json)
      : eid = json['eid'],
        title = json['title'],
        tags = List<String>.from(json['tags']),
        watchCounter = json['watch_counter'],
        starCounter = json['star_counter'],
        commentCounter = json['comment_counter'],
        createTime = json['create_time'],
        updateTime = json['update_time'],
        isGet = json['is_get'],
        isCollect = json['is_collect'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eid'] = this.eid;
    data['title'] = this.title;
    data['tags'] = this.tags;
    data['watch_counter'] = this.watchCounter;
    data['star_counter'] = this.starCounter;
    data['comment_counter'] = this.commentCounter;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['is_get'] = this.isGet;
    data['is_collect'] = this.isCollect;
    return data;
  }
}
