import 'package:flutter/material.dart';
import 'package:uni_party/widgets/button/button.dart';

import 'package:uni_party/widgets/rounded/rounded.dart';
import 'package:uni_party/styles/styles.dart';

import 'nav_card.dart';

class ProfileInfoBrowsePage extends StatefulWidget {
  const ProfileInfoBrowsePage({Key? key}) : super(key: key);

  @override
  _ProfileInfoBrowsePageState createState() => _ProfileInfoBrowsePageState();
}

class _ProfileInfoBrowsePageState extends State<ProfileInfoBrowsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            topView(),
            bottomView(),
          ],
        ),
      ),
    );
  }

  Widget topView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// 顶部操作按钮
        topActionsView(),

        /// 用户头像显示
        avatarView(),

        /// 关注数、粉丝数
        userDataView(),
      ],
    );
  }

  Widget bottomView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '她的发布\u{1f447}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),

        /// 他的发布
        userPublishView(),
        SizedBox(height: 4),
      ],
    );
  }

  Widget userPublishView() {
    return Row(
      children: [
        UserPublishNavCardWidget(
          iconLocation: 'assets/icons/events/notice.png',
          label: '消息',
          counter: 256,
          to: '',
          color: ColorsX.green,
        ),
        UserPublishNavCardWidget(
          iconLocation: 'assets/icons/events/notice.png',
          label: '视频',
          counter: 20,
          to: '',
          color: ColorsX.orange,
        ),
      ],
    );
  }

  Widget avatarView() {
    return Container(
      width: double.infinity,
      height: 160,
      color: Colors.black,
      alignment: Alignment.bottomCenter,
      child: RoundedAvatar.network(
        'http://qzu191yre.hn-bkt.clouddn.com/image/546.jpg',
        size: 96,
        margin: const EdgeInsets.only(bottom: 8),
      ),
    );
  }

  Widget userDataView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '魔咔啦咔',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('啦法律AV兰考南'),
        SizedBox(height: 2),
        RawChip(
          label: Text('四川师范大学 工学院'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _ShowDataWidget(
              counter: 62,
              label: '粉丝',
            ),
            _ShowDataWidget(
              counter: 62,
              label: '关注',
            ),
            _ShowDataWidget(
              counter: 62,
              label: '浏览',
            ),
          ],
        ),
      ],
    );
  }

  Widget topActionsView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackBtn(),
        _MoreOperatesBtn(),
      ],
    );
  }
}

class _ShowDataWidget extends StatelessWidget {
  const _ShowDataWidget({
    Key? key,
    required this.label,
    required this.counter,
  }) : super(key: key);

  final String label;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w100,
          ),
        ),
        Text(
          counter.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

enum _MoreOperate {
  share,
  report,
  follow,
}

class _MoreOperatesBtn extends StatelessWidget {
  const _MoreOperatesBtn({
    Key? key,
    this.onSelected,
  }) : super(key: key);

  final void Function(_MoreOperate)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_MoreOperate>(
      onSelected: onSelected,
      tooltip: '更多操作',
      itemBuilder: (context) {
        return <PopupMenuEntry<_MoreOperate>>[
          PopupMenuItem(
            child: Text('分享'),
            value: _MoreOperate.share,
          ),
          PopupMenuItem(
            child: Text('关注'),
            value: _MoreOperate.follow,
          ),
          PopupMenuItem(
            child: Text('举报'),
            value: _MoreOperate.report,
          ),
        ];
      },
    );
  }
}
