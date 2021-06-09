import 'package:get/get.dart';

import 'package:uni_party/pages/home/home.dart';

final List<GetPage> routes = [
  GetPage(name: RouteNames.Home, page: () => HomePage()),
];

class RouteNames {
  static const Home = '/';
  static const Notify = '/notify';
  static const World = '/world';
  static const Chat = '/chat';
  static const Profile = '/profile';
}
