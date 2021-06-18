import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_party/components/rounded/avatar.dart';
import 'package:uni_party/model/model.dart';
import 'package:uni_party/router/routes.dart';

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
            avatar: 'http://127.0.0.1:9999/741.jpg',
            uname: '葵葵',
            message: '你死哪儿去啦？你死哪儿去啦你死哪儿去啦你死哪儿去啦你死哪儿去啦',
            counter: 3,
            dtime: '19:40',
          ),
          ChatWindowCard(
            avatar: 'http://127.0.0.1:9999/852.jpg',
            uname: '玻璃',
            message: '今天好无聊奥，你在干嘛呢',
            counter: 3,
            dtime: '昨天 09:05',
          ),
          ChatWindowCard(
            avatar: 'http://127.0.0.1:9999/963.jpg',
            uname: '姐姐',
            message: '气死我了，都不跟我说话',
            counter: 0,
            dtime: '上周',
          ),
        ],
      ),
    );
  }

  // 搜索 和 清空列表
  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: Text('聊天'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search_rounded,
          ),
        ),
        IconButton(
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
        arguments: Chat2Commun(
          uname: uname,
        ),
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: double.infinity,
          height: 72,
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
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(dtime),
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
          Text(uname),
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
