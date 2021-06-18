import 'package:url_launcher/url_launcher.dart';

/// 调用：浏览器、邮箱、拨号、短信
class Explorer {
  Explorer._();

  static Future<void> toLaunch(String uri) async {
    if (!await canLaunch(uri)) throw 'Could not launch $uri'; // 无法调用则抛出异常

    await launch(uri);
  }
}
