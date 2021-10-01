import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'locale.dart';

class TimeFormat {
  static init() {
    timeago.setLocaleMessages('zh', ZhCnMessages());
    timeago.setDefaultLocale('zh');
  }

  static String getAgo(int timestamp) {
    return timeago.format(
      DateTime.fromMillisecondsSinceEpoch(timestamp),
      locale: Get.locale?.languageCode,
    );
  }
}
