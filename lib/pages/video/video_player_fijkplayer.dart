import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late final FijkPlayer player;

  @override
  void initState() {
    super.initState();
    player = FijkPlayer()..setDataSource(widget.url, autoPlay: true);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FijkView(player: player);
  }
}

