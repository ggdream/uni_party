import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/widgets/button/button.dart';

import 'controller.dart';

class VideoSearchPage extends StatelessWidget {
  const VideoSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController);

    return Scaffold(
      appBar: _AppBar(),
      body: ListView(
        children: [],
      ),
    );
  }
}

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackBtn(),
      title: TextField(
        onChanged: SearchController.to.onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: '请输入搜索内容',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          suffixIcon: Icon(CupertinoIcons.arrow_2_circlepath_circle, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
