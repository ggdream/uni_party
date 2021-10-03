import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/tools/saver/saver.dart';

class BrowserController extends GetxController {
  BrowserController({
    required this.pid,
    int initialPage = 0,
  }) {
    index.value = initialPage;
  }

  final String? pid;
  var index = 0.obs;

  var waterMode = false.obs;
  var images = <String>[].obs;

  static BrowserController to = Get.find();

  late PageController controller;

  @override
  void onInit() {
    super.onInit();

    controller = PageController(initialPage: index.value);

    images.addAll(
      List.generate(
        18,
        (idx) => 'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/$idx.jpg',
      ),
    );
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
