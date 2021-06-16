/// 分享类型
enum ShareType {
  /// 消息
  event,

  /// 视频
  video,

  /// 用户
  user,
}



/// 分享和获取的模型
class ShareModel {
  ShareModel({
    required this.type,
    required this.content,
  });

  // final ShareMetaInfo metaInfo;

  /// 分享类型
  final ShareType type;

  /// 分享内容
  final String content;

  ShareModel.fromMap(Map<String, dynamic> json)
      : type = ShareType.values[json['type'] as int],
        content = json['content'];

  Map<String, dynamic> toJson() {
    return {
      'type': type.index,
      'content': content,
    };
  }
}
