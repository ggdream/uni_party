/// 用户搜索行为收集：请求
class ArchiveBehaviorSearchReqModel {
  final String query;

  ArchiveBehaviorSearchReqModel({
    required this.query,
  });

  ArchiveBehaviorSearchReqModel.fromJson(Map<String, dynamic> json)
      : query = json['query'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['query'] = this.query;
    return data;
  }
}

/// 用户搜索行为收集：响应
class ArchiveBehaviorSearchResModel {
  ArchiveBehaviorSearchResModel();

  ArchiveBehaviorSearchResModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

/// 用户观看时长收集：请求
class ArchiveBehaviorTimeReqModel {
  final String vid;

  ArchiveBehaviorTimeReqModel({
    required this.vid,
  });

  ArchiveBehaviorTimeReqModel.fromJson(Map<String, dynamic> json)
      : vid = json['vid'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    return data;
  }
}

/// 用户观看时长收集：响应
class ArchiveBehaviorTimeResModel {
  ArchiveBehaviorTimeResModel();

  ArchiveBehaviorTimeResModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
