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
  final String requireCaptcha;
  final String token;

  AuthLoginByCipherResModel({
    required this.requireCaptcha,
    required this.token,
  });

  AuthLoginByCipherResModel.fromJson(Map<String, dynamic> json)
      : requireCaptcha = json['require_captcha'],
        token = json['token'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['require_captcha'] = this.requireCaptcha;
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
  final String requireCaptcha;
  final String token;

  AuthLoginByCodeResModel({
    required this.requireCaptcha,
    required this.token,
  });

  AuthLoginByCodeResModel.fromJson(Map<String, dynamic> json)
      : requireCaptcha = json['require_captcha'],
        token = json['token'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['require_captcha'] = this.requireCaptcha;
    data['token'] = this.token;
    return data;
  }
}
