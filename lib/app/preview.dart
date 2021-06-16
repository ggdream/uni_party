import 'package:device_preview/device_preview.dart' hide DeviceType;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:uni_party/tools/device/device.dart';

class Preview extends StatelessWidget {
  const Preview({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  static Locale? locale(BuildContext context) => DevicePreview.locale(context);
  static TransitionBuilder get builder => DevicePreview.appBuilder;

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
        enabled: DeviceType.isDesktop && !kReleaseMode,
        builder: (context) => child,
    );
  }
}
