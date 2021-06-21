/// 用户以密码方式登录：请求
class AuthLoginByCipherReqModel {
  final String account;
  final String password;

  AuthLoginByCipherReqModel({
    required this.account,
    required this.password,
  });

  AuthLoginByCipherReqModel.fromJson(Map<String, dynamic> json)
      : account = json['account'],
        password = json['password'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account'] = this.account;
    data['password'] = this.password;
    return data;
  }
}

/// 用户以密码方式登录：响应
class AuthLoginByCipherResModel {
  final String needCaptcha;
  final String token;

  AuthLoginByCipherResModel({
    required this.needCaptcha,
    required this.token,
  });

  AuthLoginByCipherResModel.fromJson(Map<String, dynamic> json)
      : needCaptcha = json['need_captcha'],
        token = json['token'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['need_captcha'] = this.needCaptcha;
    data['token'] = this.token;
    return data;
  }
}

/// 用户以验证码方式登录：请求
class AuthLoginByCodeReqModel {
  final String deviceCode;
  final String smsCode;

  AuthLoginByCodeReqModel({
    required this.deviceCode,
    required this.smsCode,
  });

  AuthLoginByCodeReqModel.fromJson(Map<String, dynamic> json)
      : deviceCode = json['device_code'],
        smsCode = json['sms_code'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_code'] = this.deviceCode;
    data['sms_code'] = this.smsCode;
    return data;
  }
}

/// 用户以验证码方式登录：响应
class AuthLoginByCodeResModel {
  final String needCaptcha;
  final String token;

  AuthLoginByCodeResModel({
    required this.needCaptcha,
    required this.token,
  });

  AuthLoginByCodeResModel.fromJson(Map<String, dynamic> json)
      : needCaptcha = json['need_captcha'],
        token = json['token'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['need_captcha'] = this.needCaptcha;
    data['token'] = this.token;
    return data;
  }
}
