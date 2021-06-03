import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:uni_party/pages/home/home.dart';
import 'package:uni_party/pages/profile/profile.dart';

class Compose {
  static const startIdx = 0;

  static final List<Widget> pages = [
    HomePage(),
    ProfilePage(),
  ];

  static final List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: '首页'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person_rounded),
        label: '首页'
    ),
  ];
}
