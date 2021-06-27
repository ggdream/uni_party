import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:uni_party/global/global.dart';

/// 消息栏通知：应用进行运行时有效
class AppNotify {
  static late FlutterLocalNotificationsPlugin notifier;

  /// 初始化
  static void init() {
    notifier = new FlutterLocalNotificationsPlugin();
    final android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = new IOSInitializationSettings();
    final initSettings = new InitializationSettings(android: android, iOS: iOS);

    notifier.initialize(initSettings, onSelectNotification: _onSelected);
  }

  static Future<void> _onSelected(String? value) async {}

  /// 发起通知
  static Future<void> show({
    required String title,
    required String content,
    String? payload,
  }) async {
    final android = AndroidNotificationDetails(
        "com.example.uni_party.channel", AppMeta.name, "大学聚 - 消息通知");
    final iOS = IOSNotificationDetails();
    final platform = NotificationDetails(android: android, iOS: iOS);

    await notifier.show(0, title, content, platform, payload: payload);
  }
}
