import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:uni_party/components/rounded/rounded.dart';
import 'package:uni_party/components/sex/sex.dart';
import 'package:uni_party/styles/styles.dart';

/// 用户信息展示
class UserInfoView extends StatefulWidget {
  const UserInfoView({Key? key}) : super(key: key);

  @override
  _UserInfoViewState createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: PhysicalModel(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 12,
          ),
          child: mainView(),
        ),
      ),
    );
  }

  Widget mainView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        userBaseInfoView(),
        SizedBox(height: 6),
        _UserFromView(typeName: '高校', fullname: '四川师范大学'),
        dividerView(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _ShowDataWidget(label: '关注', counter: 50),
            _ShowDataWidget(label: '粉丝', counter: 954),
          ],
        ),
      ],
    );
  }

  Widget userBaseInfoView() {
    return Row(
      children: [
        RoundedAvatar.network(
          'http://qvgbcgfc6.hn-bkt.clouddn.com/image/656.jpg',
          size: 72,
        ),
        SizedBox(width: 16),
        userMottoView(),
        SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            IconImage.zhuangxiu,
            width: 32,
          ),
        ),
      ],
    );
  }

  Widget userMottoView() {
    return Expanded(
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

  Widget dividerView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        color: ColorsX.grey,
      ),
    );
  }
}

/// 粉丝、关注数据展示组件
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

/// 显示用户所在场所的类型和全称
class _UserFromView extends StatelessWidget {
  const _UserFromView({
    Key? key,
    required this.typeName,
    required this.fullname,
  }) : super(key: key);

  final String typeName;
  final String fullname;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        typeView(),
        SizedBox(width: 8),
        nameView(),
      ],
    );
  }

  Widget nameView() {
    return Flexible(
      child: RawChip(
        backgroundColor: Colors.grey[200],
        label: Text(
          fullname,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget typeView() {
    return RawChip(
      backgroundColor: Colors.black,
      label: Text(
        typeName,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
