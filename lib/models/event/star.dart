/// 点赞：请求
class EventArchiveStarReqModel {
  final String vid;
  final int type;

  EventArchiveStarReqModel({
    required this.vid,
    required this.type,
  });

  EventArchiveStarReqModel.fromJson(Map<String, dynamic> json)
      : vid = json['vid'],
        type = json['type'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    data['type'] = this.type;
    return data;
  }
}

/// 点赞：响应
class EventArchiveStarResModel {
  final bool status;

  EventArchiveStarResModel({
    required this.status,
  });

  EventArchiveStarResModel.fromJson(Map<String, dynamic> json)
      : status = json['status'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
