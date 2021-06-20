/// 获取用户发布视频：请求
class VideoPublicationsGetReqModel {
  final String uid;
  final int offset;
  final int number;

  VideoPublicationsGetReqModel({
    required this.uid,
    required this.offset,
    required this.number,
  });

  VideoPublicationsGetReqModel.fromJson(Map<String, dynamic> json)
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

/// 获取用户发布视频：响应
class VideoPublicationsGetResModel {
  late final int total;
  late final List<_Result> result;

  VideoPublicationsGetResModel({
    required this.total,
    required this.result,
  });

  VideoPublicationsGetResModel.fromJson(Map<String, dynamic> json) {
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
  final String vid;
  final String title;
  final String cover;
  final List<String> tags;
  final int watchCounter;
  final int starCounter;
  final int commentCounter;
  final String createTime;
  final String updateTime;

  _Result({
    required this.vid,
    required this.title,
    required this.cover,
    required this.tags,
    required this.watchCounter,
    required this.starCounter,
    required this.commentCounter,
    required this.createTime,
    required this.updateTime,
  });

  _Result.fromJson(Map<String, dynamic> json)
      : vid = json['vid'],
        title = json['title'],
        cover = json['cover'],
        tags = List<String>.from(['tags']),
        watchCounter = json['watch_counter'],
        starCounter = json['star_counter'],
        commentCounter = json['comment_counter'],
        createTime = json['create_time'],
        updateTime = json['update_time'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    data['title'] = this.title;
    data['cover'] = this.cover;
    data['tags'] = this.tags;
    data['watch_counter'] = this.watchCounter;
    data['star_counter'] = this.starCounter;
    data['comment_counter'] = this.commentCounter;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    return data;
  }
}
