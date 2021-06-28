import 'package:get/get.dart';

import 'package:uni_party/pages/auth/auth.dart';
import 'package:uni_party/pages/chat/chat.dart';
import 'package:uni_party/pages/event/event.dart';
import 'package:uni_party/pages/home/home.dart';
import 'package:uni_party/pages/helper/helper.dart';
import 'package:uni_party/pages/profile/profile.dart';
import 'package:uni_party/pages/start/start.dart';
import 'package:uni_party/pages/video/video.dart';
import 'package:uni_party/pages/webview/webview.dart';

final List<GetPage> routes = [
  GetPage(name: RouteNames.Home, page: () => HomePage()),
  GetPage(name: RouteNames.ChatCommunicate, page: () => ChatCommunPage()),
  GetPage(name: RouteNames.HelperQrCode, page: () => QrCodePage()),
  GetPage(name: RouteNames.HelperQrScan, page: () => QrScanPage()),
  GetPage(name: RouteNames.HelperShowText, page: () => HelperShowTextPage()),
  GetPage(name: RouteNames.StartLogoPage, page: () => StartLogoPage()),
  GetPage(
      name: RouteNames.WebViewThirdParty, page: () => WebViewThridPartyPage()),
  GetPage(name: RouteNames.TextEdit, page: () => RichEditor()),
  GetPage(
    name: RouteNames.ChatSearchFriend,
    page: () => ChatSearchFriendPage(),
  ),
  GetPage(
    name: RouteNames.EventSubscribeNotify,
    page: () => EventSubscribeNotifyPage(),
  ),
  GetPage(
    name: RouteNames.AuthLoginByCipher,
    page: () => AuthLoginByCipherPage(),
  ),
  GetPage(
    name: RouteNames.AuthLoginByCode,
    page: () => AuthLoginByCodePage(),
  ),
  GetPage(
    name: RouteNames.AuthLoginFoundPassword,
    page: () => AuthLoginFoundPasswordPage(),
  ),
  GetPage(
    name: RouteNames.ProfileInfoBrowse,
    page: () => ProfileInfoBrowsePage(),
  ),
  GetPage(
    name: RouteNames.VideoUpload,
    page: () => VideoUploadPage(),
  ),
];

/// 路由名称集合
class RouteNames {
  static const Home = '/';
  static const Event = '/event';
  static const World = '/world';
  static const Chat = '/chat';
  static const Profile = '/profile';

  /// 视频上传页
  static const VideoUpload = '/video/upload';

  /// 聊天对话页
  static const ChatCommunicate = '/chat/communicate';

  /// 用户搜索页
  static const ChatSearchPerson = '/chat/search/person';

  /// 好友搜索页
  static const ChatSearchFriend = '/chat/search/friend';

  /// 订阅通知消息页
  static const EventSubscribeNotify = '/event/subscribe/notify';

  /// 订阅投票消息页
  static const EventSubscribeVote = '/event/subscribe/vote';

  /// 订阅随机消息页
  static const EventSubscribeRandom = '/event/subscribe/random';

  /// 订阅报名消息页
  static const EventSubscribeApply = '/event/subscribe/apply';

  /// 个人二维码页
  static const HelperQrCode = '/helper/qr/code';

  /// 二维码扫描页
  static const HelperQrScan = '/helper/qr/scan';

  /// 二维码扫描页
  static const HelperShowText = '/helper/qr/scan/text';

  /// 主题设置页
  static const HelperSettingsTheme = '/helpers/settings/theme';

  /// 邮件推送页
  static const HelperSettingsEMail = '/helpers/settings/email';

  /// 安全设置页
  static const HelperSettingsSafety = '/helpers/settings/safety';

  /// 查看用户服务协议页
  static const HelperProtocolsService = '/helpers/protocols/service';

  /// 启动页
  static const StartLogoPage = '/start/logo';

  /// 浏览第三方网页页
  static const WebViewThirdParty = '/webview/third';

  /// 文本编辑页
  static const TextEdit = '/text/edit';

  /// 密码登录页
  static const AuthLoginByCipher = '/auth/login/cipher';

  /// 验证码登录页
  static const AuthLoginByCode = '/auth/login/code';

  /// 找回密码
  static const AuthLoginFoundPassword = '/auth/login/found/password';

  static const ProfileInfoBrowse = '/profile/info/browse';
}
