/// 获取用户协议：请求
class HelperProtocolsUserReqModel {
  final String version;

  HelperProtocolsUserReqModel({
    required this.version,
  });

  HelperProtocolsUserReqModel.fromJson(Map<String, dynamic> json)
      : version = json['version'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    return data;
  }
}

/// 获取用户协议：响应
class HelperProtocolsUserResModel {
  final String content;

  HelperProtocolsUserResModel({
    required this.content,
  });

  HelperProtocolsUserResModel.fromJson(Map<String, dynamic> json)
      : content = json['content'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    return data;
  }
}

/// 获取服务协议：请求
class HelperProtocolsServiceReqModel {
  final String version;

  HelperProtocolsServiceReqModel({
    required this.version,
  });

  HelperProtocolsServiceReqModel.fromJson(Map<String, dynamic> json)
      : version = json['version'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    return data;
  }
}

/// 获取服务协议：响应
class HelperProtocolsServiceResModel {
  final String content;

  HelperProtocolsServiceResModel({
    required this.content,
  });

  HelperProtocolsServiceResModel.fromJson(Map<String, dynamic> json)
      : content = json['content'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    return data;
  }
}
