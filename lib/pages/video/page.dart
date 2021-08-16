import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/styles/styles.dart';

import 'video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final res = [
    'https://www.mocas.icu/beauty/1.mp4',
    'https://www.mocas.icu/beauty/2.mp4',
    'https://www.mocas.icu/beauty/3.mp4',
    'https://www.mocas.icu/beauty/4.mp4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            videoView(),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Get.toNamed('/video/live/watch');
                },
                icon: Icon(Icons.camera),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '两个',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '视频简介',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget videoView() {
    return PageView.builder(
      physics: ScrollX.physics,
      itemCount: res.length,
      itemBuilder: (context, index) {
        return VideoPlayer(
          cover: 'https://www.mocas.icu/image/background.jpg',
          video: res[index],
        );
      },
    );
  }
}
