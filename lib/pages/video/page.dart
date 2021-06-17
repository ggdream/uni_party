import 'package:flutter/material.dart';

import 'video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  dynamic data;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // videosView(),
      ],
    );
  }

  Widget videosView() {
    return RefreshIndicator(
      onRefresh: () async {},
      child: PageView(
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          VideoPlayer(
            url:
                'https://video.pearvideo.com/mp4/third/20210608/cont-1731577-11980839-111055-hd.mp4',
          ),
          VideoPlayer(
            url:
                'https://video.pearvideo.com/mp4/third/20210608/cont-1731577-11980839-111055-hd.mp4',
          ),
          VideoPlayer(
            url:
                'https://video.pearvideo.com/mp4/third/20210608/cont-1731577-11980839-111055-hd.mp4',
          ),
          VideoPlayer(
            url:
                'https://video.pearvideo.com/mp4/third/20210608/cont-1731577-11980839-111055-hd.mp4',
          ),
          VideoPlayer(
            url:
                'https://video.pearvideo.com/mp4/third/20210608/cont-1731577-11980839-111055-hd.mp4',
          ),
        ],
      ),
    );
  }
}
