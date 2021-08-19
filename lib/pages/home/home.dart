import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suit/suit.dart';

import 'package:uni_party/pages/chat/chat.dart';
import 'package:uni_party/pages/event/event.dart';
import 'package:uni_party/pages/profile/profile.dart';
import 'package:uni_party/pages/video/video.dart';

import 'package:uni_party/styles/styles.dart';

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
            ChatPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor:
              _controller.requireFullScreen ? Colors.transparent : Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconImage.shouye, width: 24),
              label: '消息',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconImage.shipin, width: 24),
              label: '世界',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconImage.xiaoxi, width: 24),
              label: '对话',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(IconImage.wode, width: 24),
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
