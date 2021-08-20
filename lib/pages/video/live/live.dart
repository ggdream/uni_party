// import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/styles/styles.dart';

import 'chat.dart';

class VideoLiveWatchPage extends StatefulWidget {
  const VideoLiveWatchPage({Key? key}) : super(key: key);

  @override
  _VideoLiveWatchPageState createState() => _VideoLiveWatchPageState();
}

class _VideoLiveWatchPageState extends State<VideoLiveWatchPage>
    with SingleTickerProviderStateMixin {
  // final player = FijkPlayer()
  //   ..setDataSource('rtmp://101.34.2.166:1935/live/movie', autoPlay: true);

  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);

    Get.put(LiveChatController(Get.arguments ?? 5200));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // FijkView(player: player),
            AspectRatio(aspectRatio: 16 / 9),
            TabBar(
              physics: ScrollX.physics,
              controller: _controller,
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: '聊天'),
                Tab(text: '主播'),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: ScrollX.physics,
                controller: _controller,
                children: [
                  LiveChatWidget(),
                  Text('data'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // player.release();
    super.dispose();
  }
}
