/// 删除消息：请求
class EventDeleteReqModel {
  final int type;
  final String eid;

  EventDeleteReqModel({
    required this.type,
    required this.eid,
  });

  EventDeleteReqModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        eid = json['eid'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['eid'] = this.eid;
    return data;
  }
}

/// 删除消息：响应
class EventDeleteResModel {
  EventDeleteResModel();

  EventDeleteResModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
