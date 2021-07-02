import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';

import 'package:uni_party/components/rounded/rounded.dart';
import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  bool _isLiked = false;
  bool _isCollected = false;

  final FijkPlayer player = FijkPlayer()..setLoop(0);

  final res = [
    'http://qvgbcgfc6.hn-bkt.clouddn.com/test.mp4',
    'http://qvgbcgfc6.hn-bkt.clouddn.com/test.mp4',
    'http://qvgbcgfc6.hn-bkt.clouddn.com/test.mp4',
    'http://qvgbcgfc6.hn-bkt.clouddn.com/test.mp4',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      player.setDataSource(res[0], autoPlay: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsX.bluePurple,
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return SafeArea(
      child: Stack(
        children: [
          FijkView(
            player: player,
            color: ColorsX.bluePurple,
            cover: NetworkImage(
                'http://qvgbcgfc6.hn-bkt.clouddn.com/image/375.jpg'),
          ),
          InkWell(
            onTap: () async {
              if (player.state == FijkState.started) await player.pause();
              if (player.state == FijkState.paused) await player.start();
            },
            child: PageView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ],
              onPageChanged: (int index) async {
                await player.reset();
                await player.setDataSource(res[index], autoPlay: true);
              },
            ),
          ),

          /// 搜索、分享、上传
          topActionsView(),

          /// 头像、点赞、评论、收藏
          rightActionsView(),

          /// 视频元信息：用户昵称及类别、视频简介、地点
          bottomMetaInfoView(),
        ],
      ),
    );
  }

  Widget bottomMetaInfoView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _userMetaInfoView(),
        Text(
          '秋去冬来伤岁暮，南驰北逐叹涂穷',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }

  Widget _userMetaInfoView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '魔咔啦咔',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 12),
        Flexible(
          child: RawChip(
            label: Text('四川师范大学 工学院'),
          ),
        ),
      ],
    );
  }

  Widget rightActionsView() {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundedAvatar.network(
            'http://qvgbcgfc6.hn-bkt.clouddn.com/image/102.jpg',
            size: 52,
          ),
          SizedBox(height: 40),
          _starShowBtnView(),
          SizedBox(height: 12),
          _commentShowBtnView(),
          SizedBox(height: 32),
          _collectBtnView(),
        ],
      ),
    );
  }

  Widget _collectBtnView() {
    return IconButton(
      tooltip: '收藏',
      onPressed: _collectBtnClick,
      icon: Icon(
        Icons.library_add_rounded,
        size: 36,
        color: _isCollected ? Theme.of(context).primaryColor : Colors.white,
      ),
    );
  }

  Future<void> _collectBtnClick() async {
    setState(() {
      _isCollected = !_isCollected;
    });
  }

  Widget _commentShowBtnView() {
    return Column(
      children: [
        IconButton(
          tooltip: '评论',
          onPressed: () {},
          icon: Icon(
            Icons.comment_rounded,
            size: 36,
            color: Colors.white,
          ),
        ),
        Text(
          '13M',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _starShowBtnView() {
    return Column(
      children: [
        IconButton(
          tooltip: '点赞',
          onPressed: _starShowBtnClick,
          icon: Icon(
            Icons.favorite_rounded,
            size: 36,
            color: _isLiked ? Theme.of(context).primaryColor : Colors.white,
          ),
        ),
        Text(
          '13M',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Future<void> _starShowBtnClick() async {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  Widget topActionsView() {
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: '搜索',
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            tooltip: '分享',
            onPressed: () {},
            icon: Icon(
              Icons.share_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            tooltip: '上传',
            onPressed: _selectVideo,
            icon: Icon(
              Icons.cloud_upload_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectVideo() async {
    List<Media>? video = await ImagesPicker.pick(pickType: PickType.video);
    if (video == null) return;

    await Get.toNamed(RoutesNamespace.VideoUpload, arguments: video[0].path);
  }
}
