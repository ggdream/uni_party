import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';

import 'package:uni_party/components/rounded/rounded.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  bool _isLiked = false;
  bool _isCollected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: Colors.black,
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
        SizedBox(height:12),
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
          RoundedAvatar.asset(
            'assets/images/avatar.jpg',
            size: 64,
          ),
          SizedBox(height: 48),
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
    print(video[0].path);
  }
}
