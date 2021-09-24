import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// 类似哔哩哔哩评论回复文本显示框
/// `style`用于文本样式，`uStyle`用户昵称样式
/// `maxLines`为默认展示行数
/// `canExtend`为是否能展开
/// `tName`和`tUID`为被回复对象的信息
class ExpandableText extends StatefulWidget {
  const ExpandableText({
    Key? key,
    required this.text,
    this.maxLines = 4,
    this.canExtend = true,
    this.fName,
    this.fUID,
    this.tName,
    this.tUID,
    this.style,
    this.uStyle,
  }) : super(key: key);

  final String text;
  final int maxLines;
  final bool canExtend;

  final String? fName;
  final int? fUID;
  final String? tName;
  final int? tUID;

  final TextStyle? style;
  final TextStyle? uStyle;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExtend = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: !widget.canExtend || widget.text.length < 64
          ? [textView()]
          : [textView(), openView()],
    );
  }

  GestureDetector openView() {
    return GestureDetector(
      onTap: doExtend,
      child: Text(
        _isExtend ? '收起' : '展开',
        style: widget.uStyle,
      ),
    );
  }

  RichText textView() {
    return RichText(
      maxLines: _isExtend ? 99 : widget.maxLines,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: widget.style,
        children: [
          replyView(),
          TextSpan(text: widget.text),
        ],
      ),
    );
  }

  TextSpan replyView() {
    return TextSpan(
      style: widget.style,
      children: [
        TextSpan(
          text: widget.fName == null ? null : widget.fName! + ' ',
          style: widget.uStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              print(widget.fUID);
            },
        ),
        TextSpan(
          text: widget.tName == null ? null : '回复 ',
        ),
        TextSpan(
          text: widget.tName,
          style: widget.uStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              print(widget.tUID);
            },
        ),
        TextSpan(text: ' : ')
      ],
    );
  }

  doExtend() {
    setState(() {
      _isExtend = !_isExtend;
    });
  }
}
