/// 获取应用最新版本信息：请求
class HelperVersionMostNewReqModel {
  HelperVersionMostNewReqModel();

  HelperVersionMostNewReqModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

/// 获取应用最新版本信息：响应
class HelperVersionMostNewResModel {
  final String version;
  final String content;
  final String datetime;

  HelperVersionMostNewResModel({
    required this.version,
    required this.content,
    required this.datetime,
  });

  HelperVersionMostNewResModel.fromJson(Map<String, dynamic> json)
      : version = json['version'],
        content = json['content'],
        datetime = json['datetime'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['content'] = this.content;
    data['datetime'] = this.datetime;
    return data;
  }
}

/// 获取应用所有版本信息：请求
class HelperVersionAllReqModel {
  HelperVersionAllReqModel();

  HelperVersionAllReqModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

/// 获取应用所有版本信息：响应
class HelperVersionAllResModel {
  late final String version;
  late final List<_Result> result;

  HelperVersionAllResModel({
    required this.version,
    required this.result,
  });

  HelperVersionAllResModel.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    result = [];
    json['result'].forEach((v) {
      result.add(new _Result.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['result'] = this.result.map((v) => v.toJson()).toList();
    return data;
  }
}

class _Result {
  final String version;
  final String content;
  final String datetime;

  _Result({
    required this.version,
    required this.content,
    required this.datetime,
  });

  _Result.fromJson(Map<String, dynamic> json)
      : version = json['version'],
        content = json['content'],
        datetime = json['datetime'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['content'] = this.content;
    data['datetime'] = this.datetime;
    return data;
  }
}
