import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class VideoLiveWatchPage extends StatefulWidget {
  const VideoLiveWatchPage({Key? key}) : super(key: key);

  @override
  _VideoLiveWatchPageState createState() => _VideoLiveWatchPageState();
}

class _VideoLiveWatchPageState extends State<VideoLiveWatchPage> {
  final player = FijkPlayer()
    ..setDataSource('rtmp://101.34.2.166:1935/live/movie', autoPlay: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FijkView(player: player),
    );
  }

  @override
  void dispose() {
    player.release();
    super.dispose();
  }
}
