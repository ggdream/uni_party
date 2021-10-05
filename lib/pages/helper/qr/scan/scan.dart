import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:scan/scan.dart';

import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/widgets/button/button.dart';

export 'text.dart';

/// 二维码扫描页
class QrScanPage extends StatelessWidget {
  QrScanPage({Key? key}) : super(key: key);

  final ScanController _controller = ScanController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsX.bluePurple,
      body: SafeArea(
        child: Stack(
          children: [
            ScanView(
              controller: _controller,
              scanAreaScale: .6,
              scanLineColor: Theme.of(context).primaryColor,
              onCapture: _onCapture,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BackBtn(color: ColorsX.blueLight2),
              ),
            ),
            moreActionsView(),
          ],
        ),
      ),
    );
  }

  Widget moreActionsView() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 64),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 打开/关闭手电筒
            GestureDetector(
              onTap: () => _controller.toggleTorchMode(),
              child: CircleAvatar(
                child: Icon(Icons.light_outlined),
              ),
            ),
            SizedBox(width: 48),
            /// 从本地选择图片
            GestureDetector(
              onTap: () async {
                List<Media>? image = await ImagesPicker.pick();
                print(image);
                if (image == null) return;

                final result = await Scan.parse(image[0].path);
                if (result == null) return;

                await _onCapture(result);
              },
              child: CircleAvatar(
                child: Icon(Icons.image_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 扫描到数据后执行的逻辑
  Future<void> _onCapture(String value) async {
    if (value.startsWith('http')) {
      // 如果是网络地址，就用Webview打开（scan包只支持移动端，所以只考虑移动端）
      await Get.toNamed(
        RoutesNamespace.WebViewThirdParty,
        parameters: {'url': value, 'label': value},
      );
    } else if (value == 'uni_party') {
      // 自己的逻辑
    } else {
      // 跳转页面，直接显示原文本
      await Get.toNamed(RoutesNamespace.HelperShowText, arguments: value);
    }

    /// 恢复至可扫描状态
    _controller.resume();
  }
}
