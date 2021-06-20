///删除视频：请求
class VideoDeleteReqModel {
  final String vid;

  VideoDeleteReqModel({
    required this.vid,
  });

  VideoDeleteReqModel.fromJson(Map<String, dynamic> json) : vid = json['vid'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    return data;
  }
}

/// 删除视频：响应
class VideoDeleteResModel {
  VideoDeleteResModel();
  VideoDeleteResModel.fromJson();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
