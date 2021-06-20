/// 上传视频：请求
class VideoUploadReqModel {
  final String title;
  final List<String> tags;
  final String file;
  final String? location;

  VideoUploadReqModel({
    required this.title,
    required this.tags,
    required this.file,
    this.location,
  });

  VideoUploadReqModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        tags = List<String>.from(['tags']),
        file = json['file'],
        location = json['location'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['tags'] = this.tags;
    data['file'] = this.file;
    data['location'] = this.location;
    return data;
  }
}

/// 上传视频：响应
class VideoUploadResModel {
  final String vid;

  VideoUploadResModel({
    required this.vid,
  });

  VideoUploadResModel.fromJson(Map<String, dynamic> json) : vid = json['vid'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    return data;
  }
}
