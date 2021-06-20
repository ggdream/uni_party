/// 用户上传头像：请求
class UserAvatarUploadReqModel {
  final String file;

  UserAvatarUploadReqModel({
    required this.file,
  });

  UserAvatarUploadReqModel.fromJson(Map<String, dynamic> json)
      : file = json['file'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    return data;
  }
}

/// 用户上传头像：响应
class UserAvatarUploadResModel {
  final String url;

  UserAvatarUploadResModel({
    required this.url,
  });

  UserAvatarUploadResModel.fromJson(Map<String, dynamic> json)
      : url = json['url'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
