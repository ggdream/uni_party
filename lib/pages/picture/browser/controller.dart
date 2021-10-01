import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrowserController extends GetxController {
  BrowserController({
    required this.pid,
    this.initialPage = "0",
  });

  final String? pid;
  final String? initialPage;

  var images = <String>[].obs;

  static BrowserController to = Get.find();

  late PageController controller;

  @override
  void onInit() {
    super.onInit();

    int index = 0;
    if (initialPage != null) {
      final value = int.tryParse(initialPage!, radix: 10);
      if (value == null) {
        Navigator.of(Get.context!).pop();
        return;
      }

      index = value;
      print(index);
    }

    controller = PageController(initialPage: index);
    images.addAll(
      List.generate(
        18,
        (index) =>
            'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/$index.jpg',
      ),
    );
  }
}
