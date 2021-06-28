import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:scan/scan.dart';

import 'package:uni_party/router/router.dart';

export 'text.dart';

/// 二维码扫描页
class QrScanPage extends StatelessWidget {
  QrScanPage({Key? key}) : super(key: key);

  final ScanController _controller = ScanController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                BackButton(),
              ],
            ),
            Container(
              width: 250,
              height: 250,
              child: ScanView(
                controller: _controller,
                scanAreaScale: 1,
                scanLineColor: Theme.of(context).primaryColor,
                onCapture: _onCapture,
              ),
            ),
            moreActionsView(),
          ],
        ),
      ),
    );
  }

  Widget moreActionsView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /// 打开/关闭手电筒
        InkWell(
          onTap: () => _controller.toggleTorchMode(),
          child: CircleAvatar(
            child: Icon(Icons.light_outlined),
          ),
        ),

        /// 从本地选择图片
        InkWell(
          onTap: () async {
            List<Media>? image = await ImagesPicker.pick();
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
    );
  }

  /// 扫描到数据后执行的逻辑
  Future<void> _onCapture(String value) async {
    if (value.startsWith('http')) {
      // 如果是网络地址，就用Webview打开（scan包只支持移动端，所以只考虑移动端）
      await Get.toNamed(RouteNames.WebViewThirdParty, arguments: value);
    } else if (value == 'uni_party') {
      // 自己的逻辑
    } else {
      // 跳转页面，直接显示原文本
      await Get.toNamed(RouteNames.HelperShowText, arguments: value);
    }

    /// 恢复至可扫描状态
    _controller.resume();
  }
}
