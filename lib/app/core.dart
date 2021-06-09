import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';

import 'preview.dart';

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: !kReleaseMode,
      builder: Preview.builder,
      locale: Preview.locale(context),
      getPages: RouterX.routes,
      initialRoute: RouterX.InitRoute,
      theme: ThemesX.global,
    );
  }
}
