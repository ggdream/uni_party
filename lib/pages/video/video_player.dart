// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerView extends StatefulWidget {
//   const VideoPlayerView({
//     Key? key,
//     required this.url,
//   }) : super(key: key);

//   final String url;

//   @override
//   _VideoPlayerViewState createState() => _VideoPlayerViewState();
// }

// class _VideoPlayerViewState extends State<VideoPlayerView> {
//   late final VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.url)
//       ..initialize().then(
//         (_) {
//           setState(() {
//             _controller.play();
//           });
//         },
//       );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       child: VideoPlayer(_controller),
//       onTap: () {
//         print('object');
//         _controller.value.isPlaying ? _controller.pause() : _controller.play();
//       },
//     );
//   }
// }
