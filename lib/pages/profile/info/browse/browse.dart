import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uni_party/styles/color.dart';

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
      child: Column(
        children: [
          /// 顶部操作按钮
          topActionsView(),

          /// 用户头像显示
          Container(
            
          ),

          /// 关注数、粉丝数
          userDataView(),
        ],
      ),
    );
  }

  Row userDataView() {
    return Row(
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
    );
  }

  Widget topActionsView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BackButton(),
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
