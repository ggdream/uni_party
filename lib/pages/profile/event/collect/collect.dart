import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:uni_party/widgets/button/button.dart';
import 'package:uni_party/widgets/rounded/rounded.dart';
import 'package:uni_party/widgets/sex/sex.dart';
import 'package:uni_party/styles/styles.dart';

class ProfileEventCollectPage extends StatefulWidget {
  const ProfileEventCollectPage({Key? key}) : super(key: key);

  @override
  _ProfileEventCollectPageState createState() =>
      _ProfileEventCollectPageState();
}

class _ProfileEventCollectPageState extends State<ProfileEventCollectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        children: [
          _EventPublishCardWidget(),
          _EventPublishCardWidget(),
          _EventPublishCardWidget(),
          _EventPublishCardWidget(),
          _EventPublishCardWidget(),
          _EventPublishCardWidget(),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: BackBtn(),
      title: Text('我收藏的消息'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_rounded),
          tooltip: '搜索',
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share_rounded),
          tooltip: '分享',
        ),
      ],
    );
  }
}

class _EventPublishCardWidget extends StatelessWidget {
  const _EventPublishCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          print('object');
        },
        child: mainView(),
      ),
    );
  }

  Widget mainView() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topTextView(),
            SizedBox(height: 32),
            showDataView(),
            SizedBox(height: 4),
            datetimeView(),
            Divider(),
            Row(
              children: [
                RoundedAvatar.network(
                  'http://qy7zrkdso.hn-bkt.clouddn.com/image/656.jpg',
                  size: 50,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      unameAndSexView(),
                      Text(
                        '朝着太阳生长，做一个温暖的人，不卑不亢，清澈善良。',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget unameAndSexView() {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.fade,
      text: TextSpan(
        style: TextStyle(color: Colors.black),
        children: [
          WidgetSpan(
            alignment: ui.PlaceholderAlignment.middle,
            child: SexView(isMan: false),
          ),
          WidgetSpan(child: SizedBox(width: 8)),
          TextSpan(
            text: '魔咔啦咔',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget showDataView() {
    return Row(
      children: [
        _ShowDataChip(
          icon: IconImage.renwu,
          counter: 57.toString(),
        ),
        _ShowDataChip(
          icon: IconImage.xiaoxi,
          counter: 12.toString(),
        ),
      ],
    );
  }

  Widget datetimeView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RawChip(
          avatar: Icon(Icons.date_range_rounded, color: Colors.white),
          backgroundColor: Colors.black,
          label: Text(
            '2021-07-02 17:42',
            style: TextStyle(color: Colors.white),
          ),
        ),
        _MoreOperatesBtn(),
      ],
    );
  }

  Widget topTextView() {
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          WidgetSpan(
            alignment: ui.PlaceholderAlignment.middle,
            child: RawChip(
              label: Text('通知'),
              backgroundColor: ColorsX.bluePurple,
            ),
          ),
          WidgetSpan(child: SizedBox(width: 12)),
          TextSpan(
            text: '啊这，绝了，重大通知，必看啊这，绝了，重大通知，必看啊这，绝了，重大通知，必看啊这，绝了，重大通知，必看',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

enum _MoreOperate {
  share,
  delete,
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
      tooltip: '更多操作',
      onSelected: onSelected,
      itemBuilder: (context) {
        return <PopupMenuEntry<_MoreOperate>>[
          PopupMenuItem(
            child: Text('分享'),
            value: _MoreOperate.share,
          ),
          PopupMenuItem(
            child: Text('移除'),
            value: _MoreOperate.delete,
          ),
        ];
      },
    );
  }
}

class _ShowDataChip extends StatelessWidget {
  const _ShowDataChip({
    Key? key,
    required this.icon,
    required this.counter,
    this.to,
    this.arguments,
  }) : super(key: key);

  final String icon;
  final String counter;

  final String? to;
  final dynamic arguments;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: mainView(),
        onTap: to == null ? null : () => Get.toNamed(to!, arguments: arguments),
      ),
    );
  }

  Widget mainView() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon, width: 28),
        SizedBox(width: 4),
        Text(counter),
      ],
    );
  }
}
