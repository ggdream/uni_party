import 'package:get/get.dart';

import 'package:uni_party/api/api.dart';
import 'package:uni_party/logic/chat/chat.dart';
import 'package:uni_party/tools/notify/notify.dart';

Future<void> initialize() async {
  BaseClient.init();
  Get.put(ChatController());
}

Future<void> initializeLate() async {
  AppNotify.init();
}
