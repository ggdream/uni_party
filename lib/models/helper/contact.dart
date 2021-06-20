/// 联系我们：请求
class HelperContactUsReqModel {
  HelperContactUsReqModel();

  HelperContactUsReqModel.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

/// 联系我们：响应
class HelperContactUsResModel {
  late final String phone;
  late final _Email email;

  HelperContactUsResModel({
    required this.phone,
    required this.email,
  });

  HelperContactUsResModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = new _Email.fromJson(json['email']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['email'] = this.email.toJson();
    return data;
  }
}

class _Email {
  final String feedback;
  final String authentication;
  final String cooperation;

  _Email({
    required this.feedback,
    required this.authentication,
    required this.cooperation,
  });

  _Email.fromJson(Map<String, dynamic> json)
      : feedback = json['feedback'],
        authentication = json['authentication'],
        cooperation = json['cooperation'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feedback'] = this.feedback;
    data['authentication'] = this.authentication;
    data['cooperation'] = this.cooperation;
    return data;
  }
}
