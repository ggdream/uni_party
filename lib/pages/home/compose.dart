import 'package:flutter/material.dart';

import 'package:uni_party/pages/chat/chat.dart';
import 'package:uni_party/pages/event/event.dart';
import 'package:uni_party/pages/profile/profile.dart';
import 'package:uni_party/pages/video/video.dart';

class Compose {
  static const startIdx = 0;

  static final List<Widget> pages = [
    EventPage(),
    VideoPage(),
    ChatPage(),
    ProfilePage(),
  ];

  static final List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.notifications_active_rounded), label: '消息'),
    BottomNavigationBarItem(icon: Icon(Icons.videocam_rounded), label: '世界'),
    BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_rounded), label: '对话'),
    BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: '我的'),
  ];
}
