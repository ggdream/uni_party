import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:markdown/markdown.dart' as md;

import 'package:uni_party/router/router.dart';
import 'package:uni_party/tools/explorer/explorer.dart';

import 'controller.dart';

class PreviewerView extends StatefulWidget {
  const PreviewerView({Key? key}) : super(key: key);

  @override
  _PreviewerViewState createState() => _PreviewerViewState();
}

class _PreviewerViewState extends State<PreviewerView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: MarkdownBody(
        data: TextController.to.controller.text,
        selectable: true,
        extensionSet: extensionSet(),
        imageBuilder: _Builder.imageBuilder,
        onTapLink: _Builder._onClickLink,
        styleSheet: MarkdownStyleSheet(
          a: TextStyle(
            color: Colors.deepPurpleAccent[100],
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  md.ExtensionSet extensionSet() {
    return md.ExtensionSet(
      md.ExtensionSet.gitHubFlavored.blockSyntaxes,
      [
        md.EmojiSyntax(),
        ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
      ],
    );
  }
}

class _Builder {
  static Widget imageBuilder(Uri uri, String? _, String? alt) {
    Widget? image;
    if (uri.scheme == 'http' || uri.scheme == 'https') {
      image = Image.network(
        uri.toString(),
        errorBuilder: (a, b, c) => _imageError(alt),
      );
    } else if (uri.scheme == 'resource') {
      image = Image.asset(
        uri.path,
        errorBuilder: (a, b, c) => _imageError(alt),
      );
    } else {
      var path = uri.path;
      if (Platform.isWindows) {
        path = '${uri.scheme}:$path';
      }
      image = Image.file(
        File(path),
        errorBuilder: (a, b, c) => _imageError(alt),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 48,
        vertical: 16,
      ),
      child: ClipRRect(
        child: image,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  static Widget _imageError(String? alt) {
    return Center(
      child: Text(
        alt! == '' ? '图片走丢了~~' : alt,
      ),
    );
  }

  static Future<void> _onClickLink(String text, String? href, _) async {
    if (href == null) return;

    if (Platform.isAndroid || Platform.isIOS) {
      await Get.toNamed(
        RoutesNamespace.WebViewThirdParty,
        parameters: {'url': href, 'label': text},
      );
    } else {
      await Explorer.toLaunch(href);
    }
  }
}
