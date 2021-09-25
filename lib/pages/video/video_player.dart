import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    Key? key,
    required this.cover,
    required this.video,
  }) : super(key: key);

  final String cover;
  final String video;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();

    // 屏幕常亮由`Wakelock.toggle`控制
    // package:uni_party/lib/pages/home/controller.dart
    player.setLoop(0);
    player.setDataSource(widget.video, autoPlay: true);
  }

  @override
  void dispose() {
    player.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FijkView(
      color: Colors.black,
      cover: NetworkImage(widget.cover),
      player: player,
      panelBuilder: _panelBuilder,
    );
  }

  Widget _panelBuilder(
    FijkPlayer player,
    FijkData data,
    BuildContext context,
    Size viewSize,
    Rect texturePos,
  ) {
    return CustomFijkPanel(
      player: player,
      data: data,
      context: context,
      viewSize: viewSize,
      texturePos: texturePos,
    );
  }
}

class CustomFijkPanel extends StatefulWidget {
  final FijkPlayer player;
  final FijkData data;
  final BuildContext context;
  final Size viewSize;
  final Rect texturePos;

  const CustomFijkPanel({
    required this.player,
    required this.data,
    required this.context,
    required this.viewSize,
    required this.texturePos,
  });

  @override
  _CustomFijkPanelState createState() => _CustomFijkPanelState();
}

class _CustomFijkPanelState extends State<CustomFijkPanel> {
  FijkPlayer get player => widget.player;
  bool _playing = false;

  @override
  void initState() {
    super.initState();
    widget.player.addListener(_onValueChanged);
  }

  void _onValueChanged() {
    FijkValue value = player.value;

    bool playing = (value.state == FijkState.started);
    if (playing != _playing) {
      setState(() {
        _playing = playing;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: InkWell(
        child: SizedBox.expand(),
        onTap: () {
          _playing ? widget.player.pause() : widget.player.start();
        },
      ),
    );
  }

  @override
  void dispose() {
    player.removeListener(_onValueChanged);
    super.dispose();
  }
}
