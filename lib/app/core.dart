import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/global/global.dart';
import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/tools/i18n/i18n.dart';

import 'init.dart';
import 'preview.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class Core extends StatefulWidget {
  const Core({Key? key}) : super(key: key);

  @override
  _CoreState createState() => _CoreState();
}

class _CoreState extends State<Core> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      initializeLate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      localizationsDelegates: I18n.delegates,
      supportedLocales: I18n.supportedLocales,
      debugShowCheckedModeBanner: false,
      enableLog: !kReleaseMode,
      builder: Preview.builder,
      locale: Preview.locale(context),
      getPages: RouterX.routes,
      initialRoute: RouterX.InitRoute,
      theme: ThemeX.global,
      title: AppMeta.name,
      defaultTransition: Transition.cupertino,
    );
  }
}
