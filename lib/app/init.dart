import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:uni_party/api/api.dart';
import 'package:uni_party/logic/chat/chat.dart';
import 'package:uni_party/tools/device/device.dart';
import 'package:uni_party/tools/notify/notify.dart';
import 'package:uni_party/tools/push_channel/push_channel.dart';
import 'package:uni_party/tools/time_format/time_format.dart';

import 'init_noweb.dart' if (dart.library.html) 'init_web.dart';

Future<void> initialize() async {
  HttpOverrides.global = MyHttpOverrides();
  TimeFormat.init();
  BaseClient.init();
  Get.put(ChatController());

  configureApp();
}

Future<void> initializeLate() async {
  final style = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  );
  SystemChrome.setSystemUIOverlayStyle(style);

  if (DeviceType.isMobile) {
    AppNotify.init();
   // await PushChannel.register(alias: 'test');
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
