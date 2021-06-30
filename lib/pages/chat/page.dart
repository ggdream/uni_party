import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/components/rounded/rounded.dart';
import 'package:uni_party/models/models.dart';
import 'package:uni_party/router/router.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          ChatWindowCard(
            avatar: 'http://qvgbcgfc6.hn-bkt.clouddn.com/image/108.jpg',
            uname: '葵葵',
            message: '你死哪儿去啦？你死哪儿去啦你死哪儿去啦你死哪儿去啦你死哪儿去啦',
            counter: 3,
            dtime: '19:40',
          ),
          ChatWindowCard(
            avatar: 'http://qvgbcgfc6.hn-bkt.clouddn.com/image/108.jpg',
            uname: '玻璃',
            message: '今天好无聊奥，你在干嘛呢',
            counter: 3,
            dtime: '昨天 09:05',
          ),
          ChatWindowCard(
            avatar: 'http://qvgbcgfc6.hn-bkt.clouddn.com/image/108.jpg',
            uname: '姐姐',
            message: '气死我了，都不跟我说话',
            counter: 0,
            dtime: '上周',
          ),
        ],
      ),
      // floatingActionButton: floatingBtn(),
    );
  }

  // Widget floatingBtn() {
  //   return FloatingActionButton(
  //     heroTag: 'chat',
  //     child: Icon(Icons.search_rounded),
  //     onPressed: () => Get.toNamed(RouteNames.ChatSearchFriend),
  //   );
  // }

  // 搜索 和 清空列表
  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: Text('聊天'),
      actions: [
        IconButton(
          tooltip: '全网搜索',
          onPressed: () => Get.toNamed(RouteNames.ChatSearchFriend),
          icon: Icon(
            Icons.search_rounded,
          ),
        ),
        IconButton(
          tooltip: '清空列表',
          onPressed: () {},
          icon: Icon(
            Icons.clear_rounded,
          ),
        ),
      ],
    );
  }
}

class ChatWindowCard extends StatelessWidget {
  const ChatWindowCard({
    Key? key,
    required this.avatar,
    required this.uname,
    required this.message,
    required this.counter,
    required this.dtime,
  }) : super(key: key);

  final String avatar;
  final String uname;
  final String message;
  final int counter;
  final String dtime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Get.toNamed(
        RouteNames.ChatCommunicate,
        arguments: Chat2CommunRouteModel(
          uname: uname,
        ),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: double.infinity,
          height: 96,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 10,
          ),
          child: Row(
            children: [
              RoundedAvatar.network(
                avatar,
                size: 54,
              ),
              SizedBox(
                width: 8,
              ),
              textView(context),
              metaView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget metaView() {
    return SizedBox(
      width: 80,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(dtime),
          SizedBox(
            height: 4,
          ),
          counter <= 0 ? Text('') : Chip(label: Text(counter.toString())),
        ],
      ),
    );
  }

  Widget textView(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 8 - 16 - 54 - 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            uname,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            message,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
