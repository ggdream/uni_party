import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';

import 'package:uni_party/widgets/rich_shower/rich_shower.dart';
import 'package:uni_party/widgets/sheet/sheet.dart';
import 'package:uni_party/widgets/snackbar/snackbar.dart';
import 'package:uni_party/logic/logic.dart';
import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';

import 'transform.dart';

class RichEditor extends StatefulWidget {
  const RichEditor({
    Key? key,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.color = Colors.black,
  }) : super(key: key);

  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmitted;
  final void Function()? onTap;

  final Color color;

  @override
  _RichEditorState createState() => _RichEditorState();
}

class _RichEditorState extends State<RichEditor> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _editingController = TextEditingController();

  final EventPublishType _type = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: bodyView(),
      floatingActionButton: floatingBtn(),
    );
  }

  Widget floatingBtn() {
    return FloatingActionButton(
      onPressed: _nextStepClick,
      child: _AdditionBtn(
        onSelected: (_AdditionType? type) async {
          if (type == null) return;

          switch (type) {
            case _AdditionType.url:
              await _addLinkClick();
              break;
            case _AdditionType.img:
              await _addImageClick();
              break;
            default:
          }
        },
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: BackButton(),
      title: Text('编辑文本'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () async {
            await showBottomSheetX(
              context,
              Container(
                width: double.infinity,
                height: double.infinity,
                child: CupertinoScrollbar(
                  child: SingleChildScrollView(
                    child: RichShower(text: _editingController.text),
                  ),
                ),
              ),
            );
          },
          icon: Icon(Icons.preview_rounded),
          tooltip: '预览',
        ),
        IconButton(
          onPressed: _nextStepClick,
          icon: Icon(Icons.next_plan_rounded),
          tooltip: '下一步',
        ),
      ],
    );
  }

  Future<void> _nextStepClick() async {
    var route = '';
    switch (_type) {
      case EventPublishType.notice:
        route = RoutesNamespace.EventPublishNotify;
        break;
      case EventPublishType.vote:
        route = RoutesNamespace.EventPublishVote;
        break;
      case EventPublishType.sortition:
        route = RoutesNamespace.EventPublishRandom;
        break;
      case EventPublishType.participation:
        route = RoutesNamespace.EventPublishApply;
        break;
      default:
        SnackBarX.showRaw(context, '消息类型错误，请重新打开本页面进行编辑');
        return;
    }

    await Get.toNamed(route, arguments: _editingController.text);
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

  /// 插入字符串，并调整光标的位置（到插入的字符串的后面）
  void _addTextAndSuitSelection(String text, int position) {
    // 输入框内容为空的情况
    if (position == -1) {
      _editingController.text = text;
      return;
    }

    _editingController.text = _editingController.text.substring(0, position) +
        text +
        _editingController.text.substring(position);
    _editingController.selection =
        TextSelection.collapsed(offset: position + text.length);
  }

  /// 逻辑：插入网络链接
  Future<void> _addLinkClick() async {
    final int position = _editingController.selection.base.offset;
    final text = await _showInputDialog(context);

    // 用户点了取消
    if (text == null) return;

    if (position == -1) {
      _editingController.text = text;
      return;
    }

    _addTextAndSuitSelection(text, position);
  }

  /// 逻辑：插入本地图片
  Future<void> _addImageClick() async {
    final int position = _editingController.selection.baseOffset;

    List<Media>? image = await ImagesPicker.pick();
    if (image == null) return;

    final text = TransformX.image(image[0].path);

    _addTextAndSuitSelection(text, position);
  }

  Widget bodyView() {
    final themeData = ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.black,
        selectionColor: Theme.of(context).primaryColor,
      ),
    );
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Theme(
          data: themeData,
          child: TextField(
            maxLines: null,
            minLines: 72,
            keyboardType: TextInputType.multiline,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            onTap: widget.onTap,
            controller: _editingController,
            scrollController: _scrollController,
            decoration: _inputDecoration(),
            scrollPhysics: const BouncingScrollPhysics(),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      hintText: '在这里输入内容...',
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
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
          Navigator.of(context).pop(TransformX.link(text, url));
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
          color: ColorsX.grey,
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
      cursorColor: ColorsX.grey,
      decoration: InputDecoration(
        hintText: '输入文本内容',
        hintStyle: TextStyle(
          color: ColorsX.grey,
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

/// 富文本类型
enum _AdditionType {
  url,
  img,
}

/// 富文本类型选择按钮
class _AdditionBtn extends StatelessWidget {
  const _AdditionBtn({
    Key? key,
    this.onSelected,
  }) : super(key: key);

  final void Function(_AdditionType?)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_AdditionType?>(
      onSelected: onSelected,
      tooltip: '添加其他',
      icon: Icon(Icons.add_rounded),
      itemBuilder: (context) {
        return <PopupMenuEntry<_AdditionType>>[
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.link_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                Text('链接'),
              ],
            ),
            value: _AdditionType.url,
          ),
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.image_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                Text('图片'),
              ],
            ),
            value: _AdditionType.img,
          ),
        ];
      },
    );
  }
}
