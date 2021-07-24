import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_party/logic/event/event.dart';
import 'package:uni_party/logic/event/page.dart';
import 'package:uni_party/router/namespace.dart';
import 'package:uni_party/styles/scroll.dart';

import 'package:uni_party/widgets/button/button.dart';

class EventSearchPage extends StatefulWidget {
  const EventSearchPage({Key? key}) : super(key: key);

  @override
  _EventSearchPageState createState() => _EventSearchPageState();
}

class _EventSearchPageState extends State<EventSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: ListView(
        physics: ScrollX.physics,
        children: [
          SimpleEventWidget(
            eid: 'FS66',
            title: 'title',
            type: EventPublishType.notice,
          ),
          SimpleEventWidget(
            eid: 'FS66',
            title: 'title',
            type: EventPublishType.participation,
          ),
          SimpleEventWidget(
            eid: 'FS66',
            title: 'title',
            type: EventPublishType.vote,
          ),
        ],
      ),
    );
  }
}

class SimpleEventWidget extends StatelessWidget {
  const SimpleEventWidget({
    Key? key,
    required this.eid,
    required this.title,
    required this.type,
  }) : super(key: key);

  final String eid;
  final String title;
  final EventPublishType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        child: GestureDetector(
          onTap: () => Get.toNamed(EventTypePage.getPageByEnum(type)!),
          child: mainView(),
        ),
      ),
    );
  }

  Widget mainView() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      leading: RawChip(label: Text(sureTypeByEnum())),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  String sureTypeByEnum() {
    switch (type) {
      case EventPublishType.notice:
        return "通知";
      case EventPublishType.vote:
        return "投票";
      case EventPublishType.sortition:
        return "随机";
      case EventPublishType.participation:
        return "报名";
      default:
        return "未知";
    }
  }
}

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackBtn(),
      title: Text('消息搜索'),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
