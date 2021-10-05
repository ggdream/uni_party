import 'package:get/get.dart';

class PictureController extends GetxController {
  var current = 0.obs;

  var images = <List<String>>[
    [
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/0.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/1.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/2.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/3.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/4.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/5.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/6.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/7.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/8.jpg',
    ],
    [
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/9.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/10.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/11.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/12.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/13.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/14.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/15.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/16.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/17.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/18.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/19.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/20.jpg',
    ],
    [
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/21.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/22.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/23.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/24.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/25.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/26.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/27.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/28.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/29.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/30.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/31.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/32.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/33.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/34.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/35.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/36.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/37.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/38.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/39.jpg',
    ],
    [
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/40.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/41.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/42.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/43.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/44.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/45.jpg',
      'https://cdn.jsdelivr.net/gh/mocaraka/assets/picture/46.jpg',
    ],
  ].obs;

  static PictureController to = Get.find();
}
