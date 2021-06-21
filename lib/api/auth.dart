import 'package:uni_party/models/models.dart';

import 'client.dart';

class AuthAPI {
  /// 使用密码登录
  static loginByCipher(AuthLoginByCipherReqModel data) => BaseClient.client
      .post<ResWrapper<AuthLoginByCipherResModel>>('/auth/login/cipher',
          data: data.toJson());

  /// 使用验证码登录
  static loginByCode(AuthLoginByCodeReqModel data) => BaseClient.client
      .post<ResWrapper<AuthLoginByCodeResModel>>('/auth/login/code',
          data: data.toJson());

  /// 发送手机验证码
  static sendPhoneCode(AuthLoginSendPhoneCodeReqModel data) => BaseClient.client
      .get<ResWrapper<AuthLoginSendPhoneCodeResModel>>('/auth/login/code/phone',
          queryParameters: data.toJson());

  /// 发送邮箱验证码
  static sendEMailCode(AuthLoginSendEMailCodeReqModel data) => BaseClient.client
      .get<ResWrapper<AuthLoginSendEMailCodeResModel>>('/auth/login/code/email',
          queryParameters: data.toJson());
}
