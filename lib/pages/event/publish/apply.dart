import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common.dart';

class EventPublishApplyPage extends StatefulWidget {
  const EventPublishApplyPage({Key? key}) : super(key: key);

  @override
  _EventPublishApplyPageState createState() => _EventPublishApplyPageState();
}

class _EventPublishApplyPageState extends State<EventPublishApplyPage> {
  final String _text = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CommonAppBar(),
      body: Container(),
    );
  }
}
