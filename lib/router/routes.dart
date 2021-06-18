import 'package:get/get.dart';

import 'package:uni_party/pages/chat/chat.dart';
import 'package:uni_party/pages/event/event.dart';
import 'package:uni_party/pages/home/home.dart';
import 'package:uni_party/pages/helper/helper.dart';
import 'package:uni_party/pages/start/start.dart';

final List<GetPage> routes = [
  GetPage(name: RouteNames.Home, page: () => HomePage()),
  GetPage(name: RouteNames.ChatCommunicate, page: () => ChatCommunPage()),
  GetPage(name: RouteNames.HelperQrCode, page: () => QrCodePage()),
  GetPage(name: RouteNames.HelperQrScan, page: () => QrScanPage()),
  GetPage(name: RouteNames.StartLogoPage, page: () => StartLogoPage()),
  GetPage(name: RouteNames.TextEdit, page: () => EditorPage()),
];

class RouteNames {
  static const Home = '/';
  static const Event = '/event';
  static const World = '/world';
  static const Chat = '/chat';
  static const Profile = '/profile';

  // 聊天对话页
  static const ChatCommunicate = '/chat/communicate';
  // 用户搜索页
  static const ChatSearchPerson = '/chat/search/person';
  // 好友搜索页
  static const ChatSearchFriend = '/chat/search/friend';

  /// 个人二维码页
  static const HelperQrCode = '/helper/qr/code';

  /// 二维码扫描页
  static const HelperQrScan = '/helper/qr/scan';

  /// 主题设置页
  static const HelperSettingsTheme = '/helpers/settings/theme';

  /// 邮件推送页
  static const HelperSettingsEMail = '/helpers/settings/email';

  /// 安全设置页
  static const HelperSettingsSafety = '/helpers/settings/safety';

  /// 启动页
  static const StartLogoPage = '/start/logo';

  /// 文本编辑页
  static const TextEdit = '/text/edit';
}
