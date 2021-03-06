import 'dart:io';

import 'package:jpush_flutter/jpush_flutter.dart';

typedef Future<dynamic> EventHandler(Map<String, dynamic> event);

class PushChannel {
  static late final JPush _jpush;

  static Future<void> register({
    required String alias,
    EventHandler? onReceiveNotification,
    EventHandler? onOpenNotification,
    EventHandler? onReceiveMessage,
    EventHandler? onReceiveNotificationAuthorization,
  }) async {
    if (!(Platform.isAndroid || Platform.isIOS)) return;

    _jpush = JPush();
    _jpush.addEventHandler(
      onReceiveNotification: onReceiveNotification,
      onOpenNotification: onOpenNotification,
      onReceiveMessage: onReceiveMessage,
      onReceiveNotificationAuthorization: onReceiveNotificationAuthorization,
    );

    _jpush.setup(
      appKey: 'key',
      channel: 'developer-default',
      production: false,
      debug: true,
    );

    await _jpush.setAlias(alias);
    _jpush.applyPushAuthority(
      NotificationSettingsIOS(sound: true, alert: true, badge: true),
    );
  }

  /// 停止推送
  static Future<dynamic> stop() => _jpush.stopPush();

  /// 恢复推送
  static Future<dynamic> resume() => _jpush.resumePush();
}
