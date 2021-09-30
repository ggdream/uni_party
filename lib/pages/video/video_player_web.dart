import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWeb extends StatefulWidget {
  const VideoPlayerWeb({
    Key? key,
    required this.cover,
    required this.video,
  }) : super(key: key);

  final String cover;
  final String video;

  @override
  _VideoPlayerWebState createState() => _VideoPlayerWebState();
}

class _VideoPlayerWebState extends State<VideoPlayerWeb> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video)
      ..initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? VideoPlayer(_controller)
        : Image.network(widget.cover);
  }
}
