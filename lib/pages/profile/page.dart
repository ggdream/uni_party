import 'package:flutter/material.dart';

import 'package:uni_party/components/rounded/rounded.dart';
import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';

import 'list_link_card.dart';

class _ProfileData {
  static final List<Widget> settingRoutes = [
    ListLinkCardWidget(
      label: '主题设置',
      image: 'assets/icons/tools/theme.png',
      to: RouteNames.HelperSettingsTheme,
    ),

    ListLinkCardWidget(
      label: '邮件设置',
      image: 'assets/icons/tools/email.png',
      to: RouteNames.HelperSettingsEMail,
    ),

    ListLinkCardWidget(
      label: '安全设置',
      image: 'assets/icons/tools/safety.png',
      to: RouteNames.HelperSettingsSafety,
    ),
  ];
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            userInfoView(),
            actionBtnView(),
            dividerView(),
            userSettingView(),
          ],
        ),
      ),
    );
  }

  Widget userSettingView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: _ProfileData.settingRoutes,
          ),
        ),
      ),
    );
  }

  Widget dividerView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        color: ColorsX.grey,
      ),
    );
  }

  Widget actionBtnView() {
    return ButtonBar(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('消息'),
          style: BtnStyles.elevatedStyle(context),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('视频'),
          style: BtnStyles.elevatedStyle(context),
        ),
      ],
    );
  }

  Widget userInfoView() {
    return Row(
      children: [
        RoundedAvatar.network(
          'http://qvgbcgfc6.hn-bkt.clouddn.com/image/658.jpg',
          size: 72,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('魔咔啦咔'),
              Text('发哦if奥佛奥佛奥佛奥普法普法皮肤啪啪法法法法分配'),
            ],
          ),
        ),
      ],
    );
  }
}
