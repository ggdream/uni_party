import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'namespace.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return RouteSettings(name: RoutesNamespace.AuthLoginByCipher);
  }
}
