import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/tools/sharex/sharex.dart';

class VideoModel {
  final int uid; // 用户id
  final String username;
  final String avatar;

  final int cid; // 大学id
  final String cLogo; // 大学徽标网络地址

  final String vid;
  final String cover;
  final String video;

  final String desc;

  bool isLoveIt;
  int loveCounter;
  final int replyCounter;

  VideoModel({
    required this.uid,
    required this.username,
    required this.avatar,
    required this.cid,
    required this.cLogo,
    required this.vid,
    required this.cover,
    required this.video,
    required this.desc,
    required this.isLoveIt,
    required this.loveCounter,
    required this.replyCounter,
  });
}

class VideoController extends GetxController {
  static VideoController get to => Get.find();

  var loveIndicator = false.obs;

  final data = <VideoModel>[
    VideoModel(
      uid: 12,
      username: '哈喽',
      avatar: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/452.jpg',
      cid: 52,
      cLogo: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/45.jpg',
      vid: '1',
      cover: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/455.jpg',
      video: 'https://cdn.jsdelivr.net/gh/ggdream/assets/beauty/4.mp4',
      desc: 'desc',
      isLoveIt: true,
      loveCounter: 25,
      replyCounter: 30,
    ),
    VideoModel(
      uid: 12,
      username: '去玩啊',
      avatar: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/52.jpg',
      cid: 52,
      cLogo: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/45.jpg',
      vid: '2',
      cover: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/357.jpg',
      video: 'https://cdn.jsdelivr.net/gh/ggdream/assets/beauty/5.mp4',
      desc: 'desc',
      isLoveIt: false,
      loveCounter: 954,
      replyCounter: 54,
    ),
    VideoModel(
      uid: 12,
      username: '搜打发',
      avatar: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/75.jpg',
      cid: 52,
      cLogo: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/45.jpg',
      vid: '3',
      cover: 'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/465.jpg',
      video: 'https://cdn.jsdelivr.net/gh/ggdream/assets/beauty/6.mp4',
      desc: 'desc',
      isLoveIt: true,
      loveCounter: 25,
      replyCounter: 30,
    ),
  ].obs;
  var currentIndex = 0.obs;

  /// 监听PageChange
  onPage(int index) {
    currentIndex.value = index;

    // TODO: 当滚动到倒数第二个时，向后端发送网络请求
  }

  VideoModel get currentVideoModel => data[currentIndex.value];

  Future<void> onLove() async {
    currentVideoModel.isLoveIt = !currentVideoModel.isLoveIt;
    currentVideoModel.isLoveIt
        ? currentVideoModel.loveCounter++
        : currentVideoModel.loveCounter--;

    loveIndicator.value = !loveIndicator.value;
  }

  Future<void> onOpen(BuildContext context, Widget child, Color color) async {
    await showModalBottomSheet(
      backgroundColor: color,
      barrierColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      context: context,
      builder: (context) {
        return child;
      },
    );
  }

  /// 不感兴趣
  Future<void> onNotInterest() async {}

  /// 下载视频
  Future<void> onDownload() async {}

  /// 收藏视频
  Future<void> onCollect(BuildContext context) async {
    Navigator.of(context).pop();
  }

  /// 分享视频
  Future<void> onShare() async {
    await ShareX.text('data');
  }
}
