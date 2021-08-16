import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FileBrowserWidget extends StatefulWidget {
  const FileBrowserWidget({
    Key? key,
    required this.url,
    this.label = '文件预览',
  }) : super(key: key);

  final String url;

  final String label;

  @override
  _FileBrowserWidgetState createState() => _FileBrowserWidgetState();
}

class _FileBrowserWidgetState extends State<FileBrowserWidget> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back_ios_rounded),
      ),
      title: Text(widget.label),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share_rounded),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.open_in_browser_rounded),
        ),
      ],
    );
  }
}
