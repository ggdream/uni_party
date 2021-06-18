import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:suit/suit.dart';

import 'package:uni_party/components/button/button.dart';
import 'package:uni_party/components/rounded/rounded.dart';
import 'package:uni_party/components/screenshot/screenshot.dart';
import 'package:uni_party/styles/color.dart';
import 'package:uni_party/tools/sharex/sharex.dart';

/// 个人二维码页
class QrCodePage extends StatelessWidget {
  QrCodePage({Key? key}) : super(key: key);

  final Color color = Colors.white;

  final ShotController _controller = ShotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0f133a),
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return SafeArea(
      child: Column(
        children: [
          topActionsView(),
          mainContentView(),
        ],
      ),
    );
  }

  Widget mainContentView() {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 32),
              child: Text(
                '我的二维码',
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
            ),
            Spacer(
              flex: 4,
            ),
            qrCodeCardView(),
            Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget qrCodeCardView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ScreenShot(
        controller: _controller,
        child: Container(
          width: double.infinity,
          height: 64.vh,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              userInfoView(),
              QrImage(
                data: 'hello',
                embeddedImage: NetworkImage(
                  'http://127.0.0.1:9999/952.jpg',
                  scale: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget userInfoView() {
    return Row(
      children: [
        RoundedAvatar.network(
          'http://127.0.0.1:9999/315.jpg',
          size: 64,
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '魔咔啦咔',
                  style: TextStyle(
                    fontSize: 24,
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
        ),
      ],
    );
  }

  /// 顶部操作按钮：返回、分享、保存
  Widget topActionsView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackBtn(
          color: color,
        ),
        Spacer(),
        IconButton(
          onPressed: _shareUser,
          icon: Icon(
            Icons.share_rounded,
            color: color,
          ),
        ),
        IconButton(
          onPressed: _saveQrCode,
          icon: Icon(
            Icons.cloud_download_rounded,
            color: color,
          ),
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
