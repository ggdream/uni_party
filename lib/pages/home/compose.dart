import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:uni_party/pages/chat/chat.dart';
import 'package:uni_party/pages/event/event.dart';
import 'package:uni_party/pages/profile/profile.dart';
import 'package:uni_party/pages/video/video.dart';

import 'package:uni_party/styles/styles.dart';

class Compose {
  static const startIdx = 0;

  static final List<Widget> pages = [
    EventPage(),
    VideoPage(),
    ChatPage(),
    ProfilePage(),
  ];

  static final List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(icon: SvgPicture.asset(IconImage.shouye, width: 32,), label: '消息'),
    BottomNavigationBarItem(icon: SvgPicture.asset(IconImage.shipin, width: 32,), label: '世界'),
    BottomNavigationBarItem(icon: SvgPicture.asset(IconImage.xiaoxi, width: 32,), label: '对话'),
    BottomNavigationBarItem(icon: SvgPicture.asset(IconImage.wode, width: 32,), label: '我的'),
  ];
}
