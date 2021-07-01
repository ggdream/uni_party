import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:uni_party/components/link/link.dart';
import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';

import 'userinfo.dart';

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
            // 顶部操作栏
            const _ActionsView(),
            SizedBox(height: 8),
            // 用户信息
            const UserInfoView(),
            SizedBox(height: 36),
            // 视频、消息 发布-收藏 详情跳转
            linksView(),
          ],
        ),
      ),
    );
  }

  Widget linksView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTileLinkWidget(
                icon: IconImage.yingshi,
                title: '视频',
                subTitle: '我的收藏',
                to: '',
              ),
              ListTileLinkWidget(
                icon: IconImage.yingshi,
                title: '视频',
                subTitle: '我的发布',
                to: '',
              ),
              ListTileLinkWidget(
                icon: IconImage.xinxi,
                title: '消息',
                subTitle: '我的收藏',
                to: '',
              ),
              ListTileLinkWidget(
                icon: IconImage.xinxi,
                title: '消息',
                subTitle: '我的发布',
                to: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 上方按钮栏：二维码扫码、应用设置
class _ActionsView extends StatelessWidget {
  const _ActionsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        qrScanBtn(),
        openSettingsBtn(),
      ],
    );
  }

  IconButton openSettingsBtn() {
    return IconButton(
      icon: SvgPicture.asset(
        IconImage.shezhi,
        width: 32,
      ),
      onPressed: () => Get.toNamed(RouteNames.HelperSettings),
      tooltip: '应用设置',
    );
  }

  IconButton qrScanBtn() {
    return IconButton(
      icon: SvgPicture.asset(
        IconImage.saomiao,
        width: 32,
      ),
      onPressed: () => Get.toNamed(RouteNames.HelperQrScan),
      tooltip: '二维码扫描',
    );
  }
}
