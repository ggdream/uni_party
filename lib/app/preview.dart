import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:uni_party/tools/platforms/platforms.dart';

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
        enabled: Platforms.isDesktop && !kReleaseMode,
        builder: (context) => child,
    );
  }
}
