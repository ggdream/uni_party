import 'dart:io';

import 'package:get/get.dart';

import 'package:uni_party/tools/permissions/permissions.dart';

/// 底部导航栏控制器、全局控制器
class BarController extends GetxController {
  var currentIndex = 0.obs;

  static BarController get to => Get.find();

  /// 监听导航栏点击
  onPage(int index) {
    currentIndex.value = index;
  }

  /// 判断是否需要占全屏
  bool get requireFullScreen => currentIndex.value == 1;

  @override
  void onInit() async {
    super.onInit();

    final res = await Permissions.request();
    if (!res) exit(1);
  }
}
