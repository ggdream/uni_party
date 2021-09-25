import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController to = Get.find();

  void onChanged(String text) {
    // TODO: 发送请求，获取数据
    print(text);
  }
}
