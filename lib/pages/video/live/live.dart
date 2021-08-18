// import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

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
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // FijkView(player: player),
          Container(
            width: double.infinity,
            height: 240,
            child: Row(),
          ),
          TabBar(
            controller: _controller,
            tabs: [
              Tab(text: '聊天'),
              Tab(text: '主播'),
              Tab(text: '其他'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                Text('data'),
                Text('data'),
                Text('data'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // player.release();
    super.dispose();
  }
}
