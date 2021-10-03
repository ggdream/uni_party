import 'package:flutter/material.dart';

import 'src/call_sample/call_sample.dart';

class ChatVoiceCallPage extends StatefulWidget {
  @override
  _ChatVoiceCallPageState createState() => new _ChatVoiceCallPageState();
}

class _ChatVoiceCallPageState extends State<ChatVoiceCallPage> {
  @override
  Widget build(BuildContext context) {
    return CallSample(host: 'demo.cloudwebrtc.com');
    // return CallSample(host: '127.0.0.1');
  }
}
