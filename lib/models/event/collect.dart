/// 收藏：请求
class EventArchiveCollectReqModel {
  final String vid;
  final int type;

  EventArchiveCollectReqModel({
    required this.vid,
    required this.type,
  });

  EventArchiveCollectReqModel.fromJson(Map<String, dynamic> json)
      : vid = json['vid'],
        type = json['type'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    data['type'] = this.type;
    return data;
  }
}

/// 收藏：响应
class EventArchiveCollectResModel {
  final bool status;

  EventArchiveCollectResModel({
    required this.status,
  });

  EventArchiveCollectResModel.fromJson(Map<String, dynamic> json)
      : status = json['status'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
