import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/components/rounded/rounded.dart';
import 'package:uni_party/components/sheet/sheet.dart';
import 'package:uni_party/mock/mock.dart';
import 'package:uni_party/router/routes.dart';

import 'card.dart';
import 'publish.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: bodyView(),
      floatingActionButton: floatBtn(),
    );
  }

  Widget floatBtn() {
    return FloatingActionButton(
      onPressed: () async {
        var res = await showTypeBottomSheet(context, PublishTypeSelected());
        if (res == null) return; // click blank area, so exit bottomSheet
        print(res);
      },
      child: Icon(Icons.add),
    );
  }

  Widget bodyView() {
    return RefreshIndicator(
      onRefresh: () async {},
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
          itemCount: EventMock.data.length,
          itemBuilder: (context, index) {
            return NotifyCard(
              uid: EventMock.data[index]['uid'],
              eid: EventMock.data[index]['eid'],
              username: EventMock.data[index]['username'],
              avatarURL: EventMock.data[index]['avatarURL'],
              datetime: EventMock.data[index]['time'],
              title: EventMock.data[index]['title'],
              isLiked: EventMock.data[index]['isLiked'],
              isCollected: EventMock.data[index]['isCollected'],
            );
          }),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: _circleAvatar(),
      centerTitle: true,
      title: Text('消息'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_rounded),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.sort_rounded),
        ),
      ],
    );
  }

  Widget _circleAvatar() {
    return GestureDetector(
      onTap: () => Get.toNamed(RouteNames.HelperQrCode),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: RoundedAvatar.asset(
          'assets/images/avatar.jpg',
          margin: const EdgeInsets.all(8),
        ),
      ),
    );
  }
}
