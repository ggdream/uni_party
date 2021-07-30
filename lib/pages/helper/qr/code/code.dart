import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:uni_party/widgets/button/button.dart';
import 'package:uni_party/widgets/rounded/rounded.dart';
import 'package:uni_party/widgets/screenshot/screenshot.dart';
import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/tools/sharex/sharex.dart';

/// 个人二维码页
class QrCodePage extends StatelessWidget {
  QrCodePage({Key? key}) : super(key: key);

  final ShotController _controller = ShotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            topActionsView(),
            mainContentView(),
          ],
        ),
      ),
    );
  }

  Widget mainContentView() {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            titleView(),
            Spacer(),
            qrCodeCardView(),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget titleView() {
    return Text(
      '我的二维码',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: ColorsX.inactive,
      ),
    );
  }

  Widget qrCodeCardView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(32),
        color: ColorsX.bluePurple,
        elevation: 3,
        child: ScreenShot(
          controller: _controller,
          child: qrcodeView(),
        ),
      ),
    );
  }

  Widget qrcodeView() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          userInfoView(),
          SizedBox(height: 32),
          QrImage(
            padding: const EdgeInsets.all(32),
            data: 'hello',
          ),
        ],
      ),
    );
  }

  Widget userInfoView() {
    return Row(
      children: [
        RoundedAvatar.network(
          'https://www.mocas.icu/image/752.jpg',
          size: 64,
        ),
        SizedBox(
          width: 12,
        ),
        userBaseInfoView(),
      ],
    );
  }

  Widget userBaseInfoView() {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '魔咔啦咔',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '我能看到日落，你在哪儿里',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  /// 顶部操作按钮：返回、分享、保存
  Widget topActionsView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackBtn(color: Colors.black),
        Spacer(),
        IconButton(
          icon: SvgPicture.asset(
            IconImage.fenxiang,
            width: 24,
          ),
          onPressed: _shareUser,
          tooltip: '分享',
        ),
        IconButton(
          icon: SvgPicture.asset(
            IconImage.xiazai,
            width: 24,
          ),
          onPressed: _saveQrCode,
          tooltip: '保存',
        ),
      ],
    );
  }

  Future<void> _shareUser() async {
    try {
      await ShareX.text('data');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _saveQrCode() async {
    try {
      final path = await _controller.save('qrcode.png');
      print(path);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
