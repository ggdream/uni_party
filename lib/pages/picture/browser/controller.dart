import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/tools/saver/saver.dart';

class BrowserController extends GetxController {
  BrowserController({
    required this.pid,
    this.initialPage = 0,
  });

  final String? pid;
  var index = 0.obs;
  final int initialPage;

  var waterMode = false.obs;
  final images = <String>[].obs;

  static BrowserController to = Get.find();

  late PageController controller;

  @override
  void onInit() {
    super.onInit();

    controller = PageController(initialPage: initialPage);
  }

  /// 在瀑布流和单个仔细看模式间互相切换
  void onSwitchWatchMode() {
    waterMode.value = !waterMode.value;
    if (!waterMode.value) controller = PageController(initialPage: index.value);
  }

  Future<void> saveImage() async {
    String text = '';

    try {
      final path = await Saver.image(images[index.value]);

      if (path == null) {
        text = '保存失败';
      } else {
        text = '保存成功';
      }
    } catch (e) {
      text = '保存失败';
    } finally {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
    }
  }

  void onPageChanged(int currentIdx) {
    index.value = currentIdx;
  }
}
