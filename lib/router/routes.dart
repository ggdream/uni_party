import 'package:get/get.dart';

import 'package:uni_party/pages/commun/commun.dart';
import 'package:uni_party/pages/home/home.dart';

final List<GetPage> routes = [
  GetPage(name: RouteNames.Home, page: () => HomePage()),
  GetPage(name: RouteNames.ChatCommunicate, page: () => CommunicatePage()),
];

class RouteNames {
  static const Home = '/';
  static const Notify = '/notify';
  static const World = '/world';
  static const Chat = '/chat';
  static const Profile = '/profile';

  // 聊天对话页
  static const ChatCommunicate = '/chat/communicate';
  // 用户搜索页
  static const ChatSearchPerson = '/chat/search/person';
  // 好友搜索页
  static const ChatSearchFriend = '/chat/search/friend';
}
