import 'package:get/get.dart';

import 'package:uni_party/pages/auth/auth.dart';
import 'package:uni_party/pages/chat/chat.dart';
import 'package:uni_party/pages/event/event.dart';
import 'package:uni_party/pages/event/search/search.dart';
import 'package:uni_party/pages/home/home.dart';
import 'package:uni_party/pages/helper/helper.dart';
import 'package:uni_party/pages/profile/profile.dart';
import 'package:uni_party/pages/start/start.dart';
import 'package:uni_party/pages/video/video.dart';
import 'package:uni_party/pages/webview/webview.dart';

// import 'middleware.dart';
import 'namespace.dart';

final List<GetPage> routes = [
  GetPage(
    name: RoutesNamespace.Home,
    page: () => HomePage(),
    // middlewares: [RouteAuthMiddleware()]
  ),
  GetPage(
    name: RoutesNamespace.ChatCommunicate,
    page: () => ChatCommunPage(),
  ),
  GetPage(
    name: RoutesNamespace.HelperQrCode,
    page: () => QrCodePage(),
  ),
  GetPage(
    name: RoutesNamespace.HelperQrScan,
    page: () => QrScanPage(),
  ),
  GetPage(
    name: RoutesNamespace.HelperShowText,
    page: () => HelperShowTextPage(),
  ),
  GetPage(
    name: RoutesNamespace.HelperSettings,
    page: () => HelperSettingsPage(),
  ),
  GetPage(
    name: RoutesNamespace.HelperSettingsEMail,
    page: () => HelperSettingsPushPage(),
  ),
  GetPage(
    name: RoutesNamespace.HelperSettingsSafety,
    page: () => HelperSettingsSafetyPage(),
  ),
  GetPage(
    name: RoutesNamespace.HelperSettingsTheme,
    page: () => HelperSettingsThemePage(),
  ),
  GetPage(
    name: RoutesNamespace.StartLogoPage,
    page: () => StartLogoPage(),
  ),
  GetPage(
    name: RoutesNamespace.WebViewThirdParty,
    page: () => WebViewThridPartyPage(),
  ),
  GetPage(
    name: RoutesNamespace.TextEdit,
    page: () => FileEditorPage(),
  ),
  GetPage(
    name: RoutesNamespace.ChatSearchFriend,
    page: () => ChatSearchFriendPage(),
  ),
  GetPage(
    name: RoutesNamespace.EventAnalysisNotify,
    page: () => EventAnalysisNotifyPage(),
  ),
  GetPage(
    name: RoutesNamespace.EventAnalysisVote,
    page: () => EventAnalysisVotePage(),
  ),
  GetPage(
    name: RoutesNamespace.EventAnalysisRandom,
    page: () => EventAnalysisRandomPage(),
  ),
  GetPage(
    name: RoutesNamespace.EventAnalysisApply,
    page: () => EventAnalysisApplyPage(),
  ),
  GetPage(
    name: RoutesNamespace.EventPublishNotify,
    page: () => EventPublishNotifyPage(),
  ),
  GetPage(
    name: RoutesNamespace.EventPublishVote,
    page: () => EventPublishVotePage(),
  ),
  GetPage(
    name: RoutesNamespace.EventPublishRandom,
    page: () => EventPublishRandomPage(),
  ),
  GetPage(
    name: RoutesNamespace.EventPublishApply,
    page: () => EventPublishApplyPage(),
  ),
  GetPage(
    name: RoutesNamespace.EventSubscribeNotify,
    page: () => EventSubscribeNotifyPage(),
  ),
  GetPage(
    name: RoutesNamespace.EventSubscribeVote,
    page: () => EventSubscribeVotePage(),
  ),
  GetPage(
    name: RoutesNamespace.EventSubscribeRandom,
    page: () => EventSubscribeRandomPage(),
  ),
  GetPage(
    name: RoutesNamespace.EventSubscribeApply,
    page: () => EventSubscribeApplyPage(),
  ),
  GetPage(
    name: RoutesNamespace.EventSearch,
    page: () => EventSearchPage(),
  ),
  GetPage(
    name: RoutesNamespace.AuthLoginByCipher,
    page: () => AuthLoginByCipherPage(),
  ),
  GetPage(
    name: RoutesNamespace.AuthLoginByCode,
    page: () => AuthLoginByCodePage(),
  ),
  GetPage(
    name: RoutesNamespace.AuthLoginFoundPassword,
    page: () => AuthLoginFoundPasswordPage(),
  ),
  GetPage(
    name: RoutesNamespace.ProfileInfoBrowse,
    page: () => ProfileInfoBrowsePage(),
  ),
  GetPage(
    name: RoutesNamespace.ProfileVideoCollect,
    page: () => ProfileVideoCollectPage(),
  ),
  GetPage(
    name: RoutesNamespace.ProfileVideoPublish,
    page: () => ProfileVideoPublishPage(),
  ),
  GetPage(
    name: RoutesNamespace.ProfileEventCollect,
    page: () => ProfileEventCollectPage(),
  ),
  GetPage(
    name: RoutesNamespace.ProfileEventPublish,
    page: () => ProfileEventPublishPage(),
  ),
  GetPage(
    name: RoutesNamespace.VideoUpload,
    page: () => VideoUploadPage(),
  ),
  GetPage(
    name: RoutesNamespace.VideoSearch,
    page: () => VideoSearchPage(),
  ),
  GetPage(
    name: RoutesNamespace.VideoLiveWatch,
    page: () => VideoLiveWatchPage(),
  ),
];
