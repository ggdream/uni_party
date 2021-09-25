import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';

import 'controller.dart';
import 'reply/reply.dart';
import 'video_player.dart';

class VideoPage extends StatelessWidget {
  VideoPage({Key? key}) : super(key: key);

  static const Color _color = Colors.white;

  final _controller = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          videoView(context),
          topActionsView(),
          bottomVideoInfoView(),
          rightActionsView(context)
        ],
      ),
    );
  }

  Widget rightActionsView(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Obx(
            () {
              VideoController.to.loveIndicator.toString();
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// 视频作者的头像
                  avatarView(),
                  SizedBox(height: 40),

                  /// 点赞
                  BrandWidget(
                    icon: Icons.favorite_rounded,
                    color: VideoController.to.currentVideoModel.isLoveIt
                        ? Colors.red
                        : _color,
                    textColor: _color,
                    brand: VideoController.to.currentVideoModel.loveCounter
                        .toString(),
                    onClick: VideoController.to.onLove,
                  ),
                  SizedBox(height: 12),

                  /// 评论
                  BrandWidget(
                    icon: CupertinoIcons.chat_bubble_text_fill,
                    color: _color,
                    textColor: _color,
                    brand: VideoController.to.currentVideoModel.replyCounter
                        .toString(),
                    onClick: () async {
                      await VideoController.to.onOpen(
                        context,
                        VideoReplyRootView(
                          vid: VideoController.to.currentVideoModel.vid,
                        ),
                        Color(0xff262626),
                      );
                    },
                  ),
                  SizedBox(height: 16),

                  /// 更多操作
                  IconButton(
                    iconSize: 40,
                    onPressed: () => VideoController.to.onOpen(
                      context,
                      _BottomActionsSheetView(),
                      Colors.white,
                    ),
                    icon: Icon(CupertinoIcons.ellipsis_circle_fill),
                    color: _color,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// 视频作者的头像
  Widget avatarView() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            VideoController.to.currentVideoModel.avatar,
          ),
        ),
      ),
    );
  }

  /// 顶部操作视图：搜索、直播、动态
  Widget topActionsView() {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              IconButton(
                onPressed: () => Get.toNamed(RoutesNamespace.VideoSearch),
                color: _color,
                icon: Icon(CupertinoIcons.search),
                tooltip: '搜索',
              ),
              Spacer(),
              IconButton(
                onPressed: () => Get.toNamed('/video/live/watch'),
                color: _color,
                icon: Icon(CupertinoIcons.videocam_circle_fill),
                tooltip: '直播',
              ),
              IconButton(
                onPressed: () => {},
                color: _color,
                icon: Icon(Icons.camera),
                tooltip: '动态',
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 视频相关元信息
  Widget bottomVideoInfoView() {
    return SafeArea(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
            left: 12,
            right: 12,
          ),
          child: Row(
            children: [
              labelView(),
              // 可以放其他信息
            ],
          ),
        ),
      ),
    );
  }

  // 视频作者与标题
  Widget labelView() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          labelTopView(),
          SizedBox(height: 4),
          Obx(
            () => Text(
              VideoController.to.currentVideoModel.desc,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: _color),
            ),
          ),
        ],
      ),
    );
  }

  Widget labelTopView() {
    return Obx(
      () => Row(
        children: [
          Text(
            VideoController.to.currentVideoModel.username,
            style: TextStyle(color: _color, fontSize: 24),
          ),
          SizedBox(width: 8),
          ClipOval(
            child: Image.network(
              VideoController.to.currentVideoModel.avatar,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget videoView(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: Obx(
        () => ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          }),
          child: PageView.builder(
            controller: PageController(
              initialPage: VideoController.to.currentIndex.value,
            ),
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            onPageChanged: VideoController.to.onPage,
            itemCount: VideoController.to.data.length,
            itemBuilder: (context, index) {
              // return VideoPlayer(
              //   cover: 'http://qzu191yre.hn-bkt.clouddn.com/image/background.jpg',
              //   video: VideoController.to.data[index].video,
              // );
              return Image.network(
                VideoController.to.data[index].cover,
                fit: BoxFit.fill,
              );
            },
          ),
        ),
      ),
    );
  }
}

/// 底部操作弹窗
class _BottomActionsSheetView extends StatelessWidget {
  const _BottomActionsSheetView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        iconTheme: IconThemeData(color: Colors.black),
      ),
      child: Container(
        height: 160,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: VideoController.to.onNotInterest,
              iconSize: 48,
              icon: Icon(CupertinoIcons.bolt_circle_fill),
              tooltip: '不感兴趣',
            ),
            IconButton(
              onPressed: VideoController.to.onDownload,
              iconSize: 48,
              icon: Icon(CupertinoIcons.arrow_down_circle_fill),
              tooltip: '下载',
            ),
            IconButton(
              onPressed: () => VideoController.to.onCollect(context),
              iconSize: 48,
              icon: Icon(CupertinoIcons.star_circle_fill),
              tooltip: '收藏',
            ),
            IconButton(
              onPressed: VideoController.to.onShare,
              iconSize: 48,
              icon: Icon(CupertinoIcons.arrowshape_turn_up_right_circle_fill),
              tooltip: '分享',
            ),
          ],
        ),
      ),
    );
  }
}

/// 图标牌子
class BrandWidget extends StatelessWidget {
  const BrandWidget({
    Key? key,
    required this.icon,
    required this.brand,
    this.color,
    this.textColor,
    this.onClick,
  }) : super(key: key);

  final IconData icon;
  final String brand;

  final Color? color;
  final Color? textColor;

  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: onClick,
          customBorder: CircleBorder(),
          child: Icon(
            icon,
            color: color,
            size: 40,
          ),
        ),
        Text(
          brand,
          style: TextStyle(color: textColor),
        ),
      ],
    );
  }
}
