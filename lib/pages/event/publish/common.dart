import 'package:flutter/material.dart';

import 'package:uni_party/widgets/button/button.dart';

import '../text_editor/controller.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackBtn(),
      title: Text('填写信息'),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            '发布',
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class SubmitMixin {
  /// 获取富文本中携带的本地图片地址
  List<String> _getLocalImages(String text) {
    return RegExp(r"!\[[^\n\[\]]*\]\(.+?\)")
        .allMatches(text)
        .toList()
        .map<String>((v) {
      final data = v.group(0)!;
      final idx = data.lastIndexOf('(');
      return data.substring(idx + 1, data.length - 1);
    }).toList();
  }

  /// 上传图片到服务器后，替换文本中的本地图片地址
  String _setNetworkImages(String text, List<String> images) {
    int index = 0;

    return text.replaceAllMapped(
      RegExp(r"!\[[^\n\[\]]*\]\(.+?\)"),
      (Match match) => '![](${images[index++]})',
    );
  }

  /// 调用入口：上传图片并且返回富文本
  Future<String> uploadImgsAndGetText(String text) async {
    String text = TextController.to.controller.text;
    final localImages = TextController.to.images;

    // 过滤用户选取后又删掉的本地图片
    List<String> newImages = [];
    for (var image in localImages) {
      if (text.contains('($image)')) {
        newImages.add(image);
      }
    }

    // 发送一次
    // TODO: 调用api接口


    return _setNetworkImages(text, newImages);
  }
}
