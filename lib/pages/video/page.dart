import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/tools/sharex/sharex.dart';

import 'video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  final res = [
    'https://www.mocas.icu/beauty/1.mp4',
    'https://www.mocas.icu/beauty/2.mp4',
    'https://www.mocas.icu/beauty/3.mp4',
    'https://www.mocas.icu/beauty/4.mp4',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            videoView(),
            topActionsView(),
            bottomVideoInfoView(),
            rightActionsVIew()
          ],
        ),
      ),
    );
  }

  Align rightActionsVIew() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            avatarView(),
            SizedBox(height: 40),
            // 点赞
            BrandWidget(
              icon: Icons.favorite_rounded,
              brand: '25',
              onClick: () {},
            ),
            SizedBox(height: 12),
            // 评论
            BrandWidget(
              icon: CupertinoIcons.chat_bubble_text_fill,
              brand: '25',
              onClick: () {},
            ),
            SizedBox(height: 16),
            // 更多操作
            IconButton(
              iconSize: 40,
              onPressed: _clickMore,
              icon: Icon(CupertinoIcons.ellipsis_circle_fill),
            ),
          ],
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
            'https://www.mocas.icu/image/875.jpg',
          ),
        ),
      ),
    );
  }

  Widget topActionsView() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(CupertinoIcons.search),
              tooltip: '搜索',
            ),
            Spacer(),
            IconButton(
              onPressed: () => Get.toNamed('/video/live/watch'),
              icon: Icon(CupertinoIcons.videocam_circle_fill),
              tooltip: '直播',
            ),
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.camera),
              tooltip: '动态',
            ),
          ],
        ),
      ),
    );
  }

  /// 视频相关元信息
  Widget bottomVideoInfoView() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 8,
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
          Text(
            '视频简介',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget labelTopView() {
    return Row(
      children: [
        Text(
          '魔咔啦咔',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(width: 8),
        ClipOval(
          child: Image.network(
            'https://pic2.zhimg.com/v2-bd165afbe15d520e279ef4354fc02186_r.jpg?source=172ae18b',
            width: 24,
            height: 24,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Future<void> _clickMore() async {
    await showModalBottomSheet(
      context: context,
      builder: (context) {
        return _ButtomActionsSheetView();
      },
    );
  }

  Widget videoView() {
    return PageView.builder(
      physics: ScrollX.physics,
      scrollDirection: Axis.vertical,
      itemCount: res.length,
      itemBuilder: (context, index) {
        return VideoPlayer(
          cover: 'https://www.mocas.icu/image/background.jpg',
          video: res[index],
        );
      },
    );
  }
}

/// 底部操作弹窗
class _ButtomActionsSheetView extends StatelessWidget {
  const _ButtomActionsSheetView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      child: Container(
        height: 160,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: _onNotInterest,
              iconSize: 48,
              icon: Icon(CupertinoIcons.bolt_circle_fill),
              tooltip: '不感兴趣',
            ),
            IconButton(
              onPressed: _onDownload,
              iconSize: 48,
              icon: Icon(CupertinoIcons.arrow_down_circle_fill),
              tooltip: '下载',
            ),
            IconButton(
              onPressed: () => _onCollect(context),
              iconSize: 48,
              icon: Icon(CupertinoIcons.star_circle_fill),
              tooltip: '收藏',
            ),
            IconButton(
              onPressed: _onShare,
              iconSize: 48,
              icon: Icon(CupertinoIcons.arrowshape_turn_up_right_circle_fill),
              tooltip: '分享',
            ),
          ],
        ),
      ),
    );
  }

  /// 不感兴趣
  Future<void> _onNotInterest() async {}

  /// 下载视频
  Future<void> _onDownload() async {}

  /// 收藏视频
  Future<void> _onCollect(BuildContext context) async {
    Navigator.of(context).pop();
  }

  /// 分享视频
  Future<void> _onShare() async {
    await ShareX.text('data');
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
