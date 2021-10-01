import 'package:dart_vlc/dart_vlc.dart';

import 'package:uni_party/tools/device/device.dart';

void configureApp() {
  if (DeviceType.isDesktop) {
    DartVLC.initialize();
  }
}
