import 'package:get/get.dart';

import 'package:uni_party/pages/home/home.dart';
import 'package:uni_party/pages/view/view.dart';

final List<GetPage> routes = [
  GetPage(name: RouteNames.View, page: () => ViewPage()),
  GetPage(name: RouteNames.Home, page: () => HomePage()),
];

class RouteNames {
  static const View = '/';
  static const Home = '/home';
}
