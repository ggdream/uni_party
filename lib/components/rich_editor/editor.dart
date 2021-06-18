import 'package:flutter/material.dart';

import 'controller.dart';
import 'transform.dart';

class RichEditor extends StatefulWidget {
  const RichEditor({
    Key? key,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.controller,
    this.backgroundColor = Colors.deepPurple,
    this.color = Colors.white,
  }) : super(key: key);

  final RichEditorController? controller;

  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmitted;
  final void Function()? onTap;

  final Color backgroundColor;
  final Color color;

  @override
  _RichEditorState createState() => _RichEditorState();
}

class _RichEditorState extends State<RichEditor> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        actionView(),
        editorView(),
      ],
    );
  }

  Widget editorView() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          top: 8,
          left: 16,
          right: 16,
        ),
        child: TextField(
          maxLines: null,
          minLines: 72,
          keyboardType: TextInputType.multiline,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          onTap: widget.onTap,
          controller: _editingController,
          scrollController: _scrollController,
          cursorColor: widget.backgroundColor,
          decoration: _inputDecoration(),
          scrollPhysics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }

  Widget actionView() {
    return Container(
      color: widget.backgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      child: Row(
        children: [
          Text(
            '工具栏',
            style: TextStyle(
              color: widget.color,
              fontSize: 18,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              final int position = _editingController.selection.baseOffset;
              final text = TransformX.link('百度一下', 'https://www.baidu.com/');
              _editingController.text =
                  _editingController.text.substring(0, position) +
                      text +
                      _editingController.text.substring(position);
              _editingController.selection =
                  TextSelection.collapsed(offset: position + text.length);
            },
            icon: Icon(
              Icons.add_link_rounded,
              color: widget.color,
            ),
            tooltip: '网络链接',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.photo_rounded,
              color: widget.color,
            ),
            tooltip: '选择图片',
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.video_collection_rounded,
              color: widget.color,
            ),
            tooltip: '选择视频',
          ),
        ],
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
