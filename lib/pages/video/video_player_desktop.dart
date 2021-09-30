import 'dart:math';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

import 'package:uni_party/pages/home/controller.dart';

class VideoPlayerDesktop extends StatefulWidget {
  const VideoPlayerDesktop({
    Key? key,
    required this.cover,
    required this.video,
  }) : super(key: key);

  final String cover;
  final String video;

  @override
  _VideoPlayerDesktopState createState() => _VideoPlayerDesktopState();
}

class _VideoPlayerDesktopState extends State<VideoPlayerDesktop> {
  static final _randomer = Random(DateTime.now().millisecondsSinceEpoch);

  final Player player = Player(id: _randomer.nextInt(65536));

  @override
  void initState() {
    super.initState();

    final media = Media.network(widget.video);
    player.open(media, autoStart: BarController.to.requireFullScreen);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => player.playOrPause(),
      child: Video(
        player: player,
        showControls: false,
      ),
    );
  }
}
