import 'package:flutter/material.dart';

import 'package:uni_party/global/global.dart';

class StartLogoPage extends StatelessWidget {
  final bool dark;

  StartLogoPage({Key? key, this.dark = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark ? Colors.black : Colors.white,
      body: Stack(
        children: [centerAppInfo(), footerAppDeclare()],
      ),
    );
  }

  Align centerAppInfo() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppMeta.logo,
            width: 192,
            height: 192,
          ),
          Text(
            AppMeta.name,
            style: TextStyle(
              color: !dark ? Colors.black : Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Align footerAppDeclare() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text(
          '© 2021 - 魔咔啦咔   ${AppMeta.version}',
          style: TextStyle(color: !dark ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
