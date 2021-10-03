import 'dart:math';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

import 'package:uni_party/pages/home/controller.dart';

class VideoPlayerOther extends StatefulWidget {
  const VideoPlayerOther({
    Key? key,
    required this.cover,
    required this.video,
  }) : super(key: key);

  final String cover;
  final String video;

  @override
  _VideoPlayerOtherState createState() => _VideoPlayerOtherState();
}

class _VideoPlayerOtherState extends State<VideoPlayerOther> {
  static final _random = Random(DateTime.now().millisecondsSinceEpoch);
  final Player player = Player(id: _random.nextInt(65536))
    ..setPlaylistMode(PlaylistMode.repeat);

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
    return GestureDetector(
      onTap: () => player.playOrPause(),
      child: Video(
        player: player,
        showControls: false,
      ),
    );
  }
}
