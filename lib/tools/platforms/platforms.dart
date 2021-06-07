import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

class Platforms {
  static final bool isWindows = _isWeb ? false : Platform.isWindows;
  static final bool isLinux = _isWeb ? false : Platform.isLinux;
  static final bool isMacOS = _isWeb ? false : Platform.isMacOS;
  static final bool isAndroid = _isWeb ? false : Platform.isAndroid;
  static final bool isIOS = _isWeb ? false : Platform.isIOS;
  static final bool isFuchsia = _isWeb ? false : Platform.isFuchsia;

  static final bool isDesktop = isWindows || isMacOS || isLinux;
  static final bool isMobile = isAndroid || isIOS || isFuchsia;

  static final bool isWeb = kIsWeb;

  static bool get _isWeb => isWeb == true;
}
