import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:uni_party/api/api.dart';
import 'package:uni_party/logic/chat/chat.dart';
import 'package:uni_party/tools/notify/notify.dart';
import 'package:uni_party/tools/push_channel/push_channel.dart';

Future<void> initialize() async {
  BaseClient.init();
  Get.put(ChatController());
}

Future<void> initializeLate() async {
  final style = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(style);

  AppNotify.init();
  await PushChannel.register(alias: 'test');
}
