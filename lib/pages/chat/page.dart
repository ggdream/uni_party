import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/logic/chat/chat.dart';
import 'package:uni_party/models/models.dart';
import 'package:uni_party/router/router.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      // body: ListView(
      //   children: [
      //     ChatWindowCard(
      //       avatar: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/108.jpg',
      //       uname: '人鱼公主纱耶香',
      //       message: '你死哪儿去啦？',
      //       counter: 3,
      //       dtime: '19:40',
      //     ),
      //     ChatWindowCard(
      //       avatar: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/874.jpg',
      //       uname: '教导主任',
      //       message: '你在干嘛呢？来趟办公室！',
      //       counter: 0,
      //       dtime: '昨天 09:05',
      //     ),
      //     ChatWindowCard(
      //       avatar: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/387.jpg',
      //       uname: '沙卡拉卡',
      //       message: '气死我了，今天好倒霉奥~',
      //       counter: 0,
      //       dtime: '上周',
      //     ),
      //   ],
      // ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: _controller.lastList.length,
            itemBuilder: (context, index) {
              return _LastMsgWidget(
                uid: _controller.lastList[index].fromUID == 2
                    ? _controller.lastList[index].toUID!
                    : _controller.lastList[index].fromUID,
                username: '魔咔啦咔',
                avatarURL:
                    'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/874.jpg',
                datetime: _controller.lastList[index].datetime,
                unreadCount: 5,
                message: _controller.lastList[index].message!,
              );
            },
          );
        },
      ),
      // floatingActionButton: floatingBtn(),
    );
  }

  // Widget floatingBtn() {
  //   return FloatingActionButton(
  //     heroTag: 'chat',
  //     child: Icon(Icons.search_rounded),
  //     onPressed: () => Get.toNamed(RoutesNamespace.ChatSearchFriend),
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
          onPressed: () => Get.toNamed(RoutesNamespace.ChatSearchFriend),
          icon: Icon(
            Icons.search_rounded,
          ),
        ),
        IconButton(
          tooltip: '清空列表',
          onPressed: () {
            _controller.clear();
          },
          icon: Icon(
            Icons.clear_rounded,
          ),
        ),
      ],
    );
  }
}

class _LastMsgWidget extends StatelessWidget {
  const _LastMsgWidget({
    Key? key,
    required this.uid,
    required this.username,
    required this.avatarURL,
    required this.datetime,
    required this.unreadCount,
    required this.message,
  }) : super(key: key);

  final int uid;
  final String username;
  final String avatarURL;

  final int datetime;
  final int unreadCount;
  final String message;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(avatarURL),
      ),
      title: Text(username, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: trailingView(),
      onTap: () => Get.toNamed(
        RoutesNamespace.ChatCommunicate,
        arguments: Chat2CommunRouteModel(
          id: uid,
          username: username,
        ),
      ),
    );
  }

  Widget trailingView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(datetime.toString()),
        unreadView(),
      ],
    );
  }

  Widget unreadView() {
    return Container(
      alignment: Alignment.center,
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: Colors.red[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        unreadCount <= 99 ? unreadCount.toString() : '99+',
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
