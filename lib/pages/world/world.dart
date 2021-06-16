import 'package:flutter/material.dart';

import 'video.dart';

class WorldPage extends StatefulWidget {
  const WorldPage({Key? key}) : super(key: key);

  @override
  _WorldPageState createState() => _WorldPageState();
}

class _WorldPageState extends State<WorldPage> {
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
