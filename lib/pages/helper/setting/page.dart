import 'package:flutter/material.dart';

import 'package:uni_party/components/button/button.dart';
import 'package:uni_party/components/link/link.dart';
import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';

class HelperSettingsPage extends StatelessWidget {
  const HelperSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTileLinkWidget(
              icon: IconImage.xuanxiang,
              title: '主题设置',
              to: RouteNames.HelperSettingsTheme,
            ),
            ListTileLinkWidget(
              icon: IconImage.xinxi,
              title: '邮件设置',
              to: RouteNames.HelperSettingsTheme,
            ),
            ListTileLinkWidget(
              icon: IconImage.anquan,
              title: '安全设置',
              to: RouteNames.HelperSettingsTheme,
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: BackBtn(),
      title: Text('应用设置'),
      centerTitle: true,
    );
  }
}
