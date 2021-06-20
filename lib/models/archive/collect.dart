/// 收藏：请求
class ArchiveCollectReqModel {
  final String vid;
  final int type;

  ArchiveCollectReqModel({
    required this.vid,
    required this.type,
  });

  ArchiveCollectReqModel.fromJson(Map<String, dynamic> json)
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
class ArchiveCollectResModel {
  final bool status;

  ArchiveCollectResModel({
    required this.status,
  });

  ArchiveCollectResModel.fromJson(Map<String, dynamic> json)
      : status = json['status'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
