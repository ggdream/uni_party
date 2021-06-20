/// 用户反馈：请求
class HelperFeedbackReqModel {
  final int type;
  final String title;
  final String content;
  final String email;

  HelperFeedbackReqModel({
    required this.type,
    required this.title,
    required this.content,
    required this.email,
  });

  HelperFeedbackReqModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        title = json['title'],
        content = json['content'],
        email = json['email'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    data['content'] = this.content;
    data['email'] = this.email;
    return data;
  }
}

/// 用户反馈：响应
class HelperFeedbackResModel {
  HelperFeedbackResModel();

  HelperFeedbackResModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
