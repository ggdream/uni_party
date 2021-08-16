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
    transition: Transition.cupertino,
    // middlewares: [RouteAuthMiddleware()]
  ),
  GetPage(
    name: RoutesNamespace.ChatCommunicate,
    page: () => ChatCommunPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.HelperQrCode,
    page: () => QrCodePage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.HelperQrScan,
    page: () => QrScanPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.HelperShowText,
    page: () => HelperShowTextPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.HelperSettings,
    page: () => HelperSettingsPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.HelperSettingsEMail,
    page: () => HelperSettingsPushPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.HelperSettingsSafety,
    page: () => HelperSettingsSafetyPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.HelperSettingsTheme,
    page: () => HelperSettingsThemePage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.StartLogoPage,
    page: () => StartLogoPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.WebViewThirdParty,
    page: () => WebViewThridPartyPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.TextEdit,
    page: () => RichEditor(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.ChatSearchFriend,
    page: () => ChatSearchFriendPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventAnalysisNotify,
    page: () => EventAnalysisNotifyPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventAnalysisVote,
    page: () => EventAnalysisVotePage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventAnalysisRandom,
    page: () => EventAnalysisRandomPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventAnalysisApply,
    page: () => EventAnalysisApplyPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventPublishNotify,
    page: () => EventPublishNotifyPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventPublishVote,
    page: () => EventPublishVotePage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventPublishRandom,
    page: () => EventPublishRandomPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventPublishApply,
    page: () => EventPublishApplyPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventSubscribeNotify,
    page: () => EventSubscribeNotifyPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventSubscribeVote,
    page: () => EventSubscribeVotePage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventSubscribeRandom,
    page: () => EventSubscribeRandomPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventSubscribeApply,
    page: () => EventSubscribeApplyPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventFilePreview,
    page: () => EventFilePreviewPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.EventSearch,
    page: () => EventSearchPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.AuthLoginByCipher,
    page: () => AuthLoginByCipherPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.AuthLoginByCode,
    page: () => AuthLoginByCodePage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.AuthLoginFoundPassword,
    page: () => AuthLoginFoundPasswordPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.ProfileInfoBrowse,
    page: () => ProfileInfoBrowsePage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.ProfileVideoCollect,
    page: () => ProfileVideoCollectPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.ProfileVideoPublish,
    page: () => ProfileVideoPublishPage(),
    transition: Transition.cupertino,
  ),

  GetPage(
    name: RoutesNamespace.ProfileEventCollect,
    page: () => ProfileEventCollectPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.ProfileEventPublish,
    page: () => ProfileEventPublishPage(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: RoutesNamespace.VideoUpload,
    page: () => VideoUploadPage(),
    transition: Transition.cupertino,
  ),
    GetPage(
    name: RoutesNamespace.VideoLiveWatch,
    page: () => VideoLiveWatchPage(),
    transition: Transition.cupertino,
  ),
];
