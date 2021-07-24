import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:uni_party/widgets/monitor/monitor.dart';
import 'package:uni_party/models/models.dart';
import 'package:uni_party/tools/safety/safety.dart';

class ListenWidget extends StatelessWidget {
  const ListenWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  void _onPaused() {
    print('离开App');
  }

  Future<void> _onResumed() async {
    final res = await Clipboard.getData(Clipboard.kTextPlain);
    if (res == null) return;

    ShareModel model;
    try {
      model = ShareModel.fromMap(json.decode(Codec.fromHex(res.text!)));
    } catch (e) {
      debugPrint(e.toString());
      return;
    }

    print(model);
  }

  @override
  Widget build(BuildContext context) {
    return MonitorWidget(
      child: child,
      onPaused: _onPaused,
      onResumed: _onResumed,
    );
  }
}
