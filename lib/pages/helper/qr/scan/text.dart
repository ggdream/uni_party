import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/tools/sharex/sharex.dart';

/// 显示可选中的文本的页面，支持返回、分享
class HelperShowTextPage extends StatelessWidget {
  HelperShowTextPage({Key? key}) : super(key: key);

  final String result = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: SelectableText(result),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: BackButton(),
      title: Text('扫描结果'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () async {
            await ShareX.text(result);
          },
          icon: Icon(Icons.share_rounded),
        ),
      ],
    );
  }
}
