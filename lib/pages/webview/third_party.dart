import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:uni_party/global/global.dart';
import 'package:uni_party/tools/explorer/explorer.dart';
import 'package:uni_party/tools/sharex/sharex.dart';
import 'package:uni_party/widgets/button/button.dart';

class WebViewThridPartyPage extends StatefulWidget {
  const WebViewThridPartyPage({
    Key? key,
  }) : super(key: key);

  @override
  _WebViewThridPartyPageState createState() => _WebViewThridPartyPageState();
}

class _WebViewThridPartyPageState extends State<WebViewThridPartyPage> {
  final params = Get.parameters;

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
      initialUrl: params['url'],
      javascriptMode: JavascriptMode.unrestricted,
      userAgent: NetworkConfig.webViewUserAgent,
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: BackBtn(),
      title: Text(params['label']!),
      actions: [
        IconButton(
          tooltip: '分享链接',
          onPressed: () async {
            await ShareX.text(params['url']!);
          },
          icon: Icon(Icons.share_rounded),
        ),
        IconButton(
          tooltip: '在浏览器中打开',
          onPressed: () async {
            await Explorer.toLaunch(params['url']!);
          },
          icon: Icon(Icons.open_in_browser_rounded),
        ),
      ],
    );
  }
}
