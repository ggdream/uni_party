/// 关于我们：请求
class HelperAboutUsReqModel {
  HelperAboutUsReqModel();

  HelperAboutUsReqModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

/// 关于我们：响应
class HelperAboutUsResModel {
  final String content;

  HelperAboutUsResModel({
  required  this.content,
  });

  HelperAboutUsResModel.fromJson(Map<String, dynamic> json):
    content = json['content'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    return data;
  }
}
