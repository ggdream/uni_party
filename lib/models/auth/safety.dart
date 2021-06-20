/// 环境审核：请求
class AuthSafetyEnvReqModel {
  final String signature;

  AuthSafetyEnvReqModel({
    required this.signature,
  });

  AuthSafetyEnvReqModel.fromJson(Map<String, dynamic> json)
      : signature = json['signature'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['signature'] = this.signature;
    return data;
  }
}

/// 环境审核：响应
class AuthSafetyEnvResModel {
  AuthSafetyEnvResModel();

  AuthSafetyEnvResModel.fromJson();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}
