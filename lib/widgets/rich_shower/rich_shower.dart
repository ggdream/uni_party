import 'dart:io';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/router/router.dart';
import 'package:url_launcher/url_launcher.dart';

// 富文本显示组件
class RichShower extends StatelessWidget {
  const RichShower({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: _textStyle(),
        children: _RichTextParser(text).parse(Theme.of(context).primaryColor),
      ),
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 18,
    );
  }
}

// 把编写的文本解析为InlineSpan
class _RichTextParser {
  _RichTextParser(this.text);

  String text;

  List<RegExpMatch>? _urls;
  List<RegExpMatch>? _images;

  _translate2Url() {
    _urls = RegExp(r"\[[^\n\[\]]*\]\(.+?\)").allMatches(text).toList();
    text = text.replaceAllMapped(RegExp(r"\[[^\n\[\]]*\]\(.+?\)"),
        (match) => '\n\u{1FFF1}\u{1FFF1}\u{1FFF1}\n');
  }

  _translate2Image() {
    _images = RegExp(r"!\[[^\n\[\]]*\]\(.+?\)").allMatches(text).toList();
    text = text.replaceAllMapped(RegExp(r"!\[[^\n\[\]]*\]\(.+?\)"),
        (match) => '\n\u{1FFF2}\u{1FFF2}\u{1FFF2}\n');
  }

  List<InlineSpan> _parse(Color color) {
    int _urlPointer = 0;
    int _imagePointer = 0;
    List<InlineSpan> res = [];

    for (var v in text.split('\n')) {
      InlineSpan span = TextSpan();
      if (v.startsWith('\u{1FFF1}\u{1FFF1}\u{1FFF1}')) {
        final text = _urls![_urlPointer].group(0)!;
        final idx = text.lastIndexOf('(');
        final url = text.substring(idx + 1, text.length - 1);
        final showText = text.substring(1, idx - 1);

        span = TextSpan(
          text: showText,
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: color,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              if (Platform.isAndroid || Platform.isIOS) {
                await Get.toNamed(RoutesNamespace.WebViewThirdParty,
                    arguments: url);
              } else {
                await canLaunch(url)
                    ? await launch(url)
                    : Get.snackbar('打开失败', url);
              }
            },
        );
        _urlPointer++;
      } else if (v.startsWith('\u{1FFF2}\u{1FFF2}\u{1FFF2}')) {
        final text = _images![_imagePointer].group(0)!;
        final idx = text.lastIndexOf('(');
        final url = text.substring(idx + 1, text.length - 1);
        final showText = text.substring(2, idx - 1);

        span = WidgetSpan(
          child: url.startsWith('http')
              ? networkImageView(url, showText)
              : nativeImageView(url, showText),
        );
        _imagePointer++;
      } else if (v.isEmpty) {
        span = TextSpan(text: '\n');
      } else {
        span = TextSpan(text: v);
      }

      res.add(span);
    }

    return res;
  }

  Widget errorView(String showText) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(showText),
          const Text(
            '图片不小心走丢了😢',
            style: TextStyle(
              fontSize: 14,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget nativeImageView(String url, String showText) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.file(
          File(url),
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return errorView(showText);
          },
        ),
      ),
    );
  }

  Widget networkImageView(String url, String showText) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          url,
          errorBuilder: (
            BuildContext context,
            Object exception,
            StackTrace? stackTrace,
          ) {
            return errorView(showText);
          },
        ),
      ),
    );
  }

  List<InlineSpan> parse(Color color) {
    _translate2Image();
    _translate2Url();

    return _parse(color);
  }
}
