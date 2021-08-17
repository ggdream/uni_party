import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';

class TextController extends GetxController {
  List<String> images = [];

  final controller = TextEditingController();

  static TextController get to => Get.find();

  Future<void> handle(BuildContext context, int index) async {
    switch (index) {
      case 0:
        await addLocalImageClick();
        break;
      case 1:
        await addRemoteImageClick(context);
        break;
      case 2:
        await addLinkClick(context);
        break;
      case 3:
        addEmphasizeClick();
        break;
      case 4:
        addHClick(1);
        break;
      case 5:
        addCodeClick();
        break;
      default:
    }
  }

  /// 逻辑：插入网络链接
  Future<void> addLinkClick(BuildContext context) async {
    final int position = controller.selection.base.offset;
    final text = await _showInputDialog(context);
    // 用户点了取消
    if (text == null) return;

    if (position == -1) {
      controller.text = text;
      return;
    }

    _addTextAndSuitSelection(text, position);
  }

  /// 逻辑：插入远程图片
  Future<void> addRemoteImageClick(BuildContext context) async {
    final int position = controller.selection.base.offset;
    final text = await _showInputDialog(context);
    // 用户点了取消
    if (text == null) return;

    if (position == -1) {
      controller.text = text;
      return;
    }

    _addTextAndSuitSelection('' + text, position);
  }

  /// 逻辑：插入本地图片
  Future<void> addLocalImageClick() async {
    final int position = controller.selection.baseOffset;

    // 不支持当前平台或取消选择，将返回null
    List<Media>? image = await ImagesPicker.pick();
    if (image == null) return;

    final path = image[0].path;
    // TODO: 上传至服务器
    // 文章时刻要保存至服务器，用户打开编辑时会拉取
    // 服务器用Redis-Set做图片记录(该键值对永久有效)
    // 用户上传文章时，后台会解析文章中的图片地址，将解析到的属于自己域下的图片
    // 合成一个集合，找到Redis中属于该用户的键值对，并删除这些内容。获取剩下的元素，删除对应的图片
    // 成功则清空该键值对，否则响应上传失败
    //
    // 若用户退出时选择不保留草稿，则直接删除键值对中对应的图片
    images.add(path);

    _addTextAndSuitSelection('![]($path)', position);
  }

  /// 逻辑：插入一、二....六级标题
  void addHClick(int level) {
    assert(level >= 1 && level <= 6);

    final int position = controller.selection.baseOffset;
    _addTextAndSuitSelection('${'#' * level} ', position);
  }

  /// 逻辑：插入强调语句块
  void addEmphasizeClick() {
    final int position = controller.selection.baseOffset;
    _addTextAndSuitSelection('****', position, 2);
  }

  /// 逻辑：插入代码块
  void addCodeClick() {
    final int position = controller.selection.baseOffset;
    _addTextAndSuitSelection('\n```\n\n```\n', position, 5);
  }

  /// 插入字符串，并调整光标的位置（到插入的字符串的后面）
  void _addTextAndSuitSelection(String text, int position, [int backSize = 0]) {
    // 兼容：输入框内容为空的情况
    if (position < 0 || controller.text.isEmpty) {
      controller.text = text;
      return;
    }

    controller.text = controller.text.substring(0, position) +
        text +
        controller.text.substring(position);
    controller.selection =
        TextSelection.collapsed(offset: position + text.length - backSize);
  }

  Future<String?> _showInputDialog(BuildContext context) async {
    return await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return _InputDialogView();
      },
    );
  }
}

class _InputDialogView extends StatelessWidget {
  _InputDialogView({
    Key? key,
  }) : super(key: key);

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '添加网络地址',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// 填写显示的文本
          _showTextView(context),

          /// 填写对应的网址
          _backLinkView(context),
        ],
      ),
      actions: _actionsView(context),
    );
  }

  List<Widget> _actionsView(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          final String text = _controller1.text;
          final String url = _controller2.text;
          if (text.isEmpty || url.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('请填写完整内容'),
                duration: Duration(seconds: 3),
              ),
            );
            return;
          }
          Navigator.of(context).pop('[$text]($url)');
        },
        child: Text('确定'),
        style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text('取消'),
        style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
      )
    ];
  }

  Widget _backLinkView(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: '输入网络地址',
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      controller: _controller2,
    );
  }

  Widget _showTextView(BuildContext context) {
    return TextField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: '输入文本内容',
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      controller: _controller1,
    );
  }
}
