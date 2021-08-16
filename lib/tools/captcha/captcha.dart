import 'package:flutter_net_captcha/flutter_net_captcha.dart';

/// 网易易盾 行为式验证码
class Captcha {
  static show() async {
    final config = VerifyCodeConfig(captchaId: 'afsxvfee');
    FlutterNetCaptcha.configVerifyCode(config);
    FlutterNetCaptcha.showCaptcha(
      language: VerifyLanguage.ZH_CN,
      onVerify: _verify,
    );
  }

  static _verify(VerifyCodeResponse response) async {
    print(response);
    // TODO: 发送至自己的服务器，进行验证
  }
}
