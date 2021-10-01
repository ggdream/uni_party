import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suit/suit.dart';

import 'package:uni_party/pages/chat/chat.dart';
import 'package:uni_party/pages/event/event.dart';
import 'package:uni_party/pages/picture/picture.dart';
import 'package:uni_party/pages/profile/profile.dart';
import 'package:uni_party/pages/video/video.dart';

import 'controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _controller = Get.put(BarController());

  @override
  Widget build(BuildContext context) {
    Adapter.initialize(context);

    return Obx(
      () => Scaffold(
        extendBody: _controller.requireFullScreen,
        body: IndexedStack(
          index: _controller.currentIndex.value,
          children: [
            EventPage(),
            VideoPage(),
            PicturePage(),
            // ChatPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor:
              _controller.requireFullScreen ? Colors.transparent : Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: '消息',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.videocam_circle_fill),
              label: '世界',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.camera_circle_fill),
              label: '画廊',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(CupertinoIcons.chat_bubble_fill),
            //   label: '对话',
            // ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_circle_fill),
              label: '我的',
            ),
          ],
          selectedFontSize: 12,
          unselectedItemColor:
              _controller.requireFullScreen ? Colors.white : null,
          type: BottomNavigationBarType.fixed,
          currentIndex: _controller.currentIndex.value,
          onTap: _controller.onPage,
        ),
      ),
    );
  }
}
