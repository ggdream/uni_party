/// 用户是否完成问卷：请求
class HelperQNFinishedReqModel {
  HelperQNFinishedReqModel();

  HelperQNFinishedReqModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

/// 用户是否完成问卷：响应
class HelperQNFinishedResModel {
  final bool status;

  HelperQNFinishedResModel({
    required this.status,
  });

  HelperQNFinishedResModel.fromJson(Map<String, dynamic> json)
      : status = json['status'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}

/// 提交问卷填写结果：请求
class HelperQNSubmitReqModel {
  final List<int> answer;

  HelperQNSubmitReqModel({
    required this.answer,
  });

  HelperQNSubmitReqModel.fromJson(Map<String, dynamic> json)
      : answer = List<int>.from(json['answer']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    return data;
  }
}

/// 提交问卷填写结果：响应
class HelperQNSubmitResModel {
  HelperQNSubmitResModel();

  HelperQNSubmitResModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

/// 获取问卷内容：请求
class HelperQNContentReqModel {
  HelperQNContentReqModel();

  HelperQNContentReqModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

/// 获取问卷内容：响应
class HelperQNContentResModel {
  late final List<_Naire> naire;

  HelperQNContentResModel({
    required this.naire,
  });

  HelperQNContentResModel.fromJson(Map<String, dynamic> json) {
    naire = [];
    json['naire'].forEach((v) {
      naire.add(new _Naire.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['naire'] = this.naire.map((v) => v.toJson()).toList();
    return data;
  }
}

class _Naire {
  final String question;
  final List<String> options;

  _Naire({
    required this.question,
    required this.options,
  });

  _Naire.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        options = List<String>.from(json['options']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['options'] = this.options;
    return data;
  }
}
