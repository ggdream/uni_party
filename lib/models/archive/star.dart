/// 点赞：请求
class ArchiveStarReqModel {
  final String vid;
  final int type;

  ArchiveStarReqModel({
    required this.vid,
    required this.type,
  });

  ArchiveStarReqModel.fromJson(Map<String, dynamic> json)
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
class ArchiveStarResModel {
  final bool status;

  ArchiveStarResModel({
    required this.status,
  });

  ArchiveStarResModel.fromJson(Map<String, dynamic> json)
      : status = json['status'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
