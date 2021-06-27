import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:uni_party/global/global.dart';

class UserAgent {
  static Future<void> init() async {
    await FkUserAgent.init();

    try {
      NetworkConfig.userAgent = FkUserAgent.userAgent!;
      NetworkConfig.webViewUserAgent = FkUserAgent.webViewUserAgent!;
    } catch (e) {
      NetworkConfig.userAgent = 'unknown';
      NetworkConfig.webViewUserAgent = 'unknown';
    }
  }
}
