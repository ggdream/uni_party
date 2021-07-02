import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:uni_party/components/button/button.dart';
import 'package:uni_party/router/router.dart';
import 'package:uni_party/styles/styles.dart';

class ProfileEventPublishPage extends StatefulWidget {
  const ProfileEventPublishPage({Key? key}) : super(key: key);

  @override
  _ProfileEventPublishPageState createState() =>
      _ProfileEventPublishPageState();
}

class _ProfileEventPublishPageState extends State<ProfileEventPublishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
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
      title: Text('我发布的消息'),
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
        margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topTextView(),
            SizedBox(height: 8),
            datetimeView(),
            SizedBox(height: 24),
            showDataView(),
            Divider(),
            bottomBtns(),
          ],
        ),
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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RawChip(
          avatar: Icon(Icons.date_range_rounded, color: Colors.white),
          backgroundColor: Colors.black,
          label: Text(
            '2021-07-02 17:42',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget bottomBtns() {
    return ButtonBar(
      children: [
        ElevatedButton(
          onPressed: () => Get.toNamed(RoutesNamespace.EventAnalysisNotify),
          child: Text('分析'),
        ),
        ElevatedButton(
          onPressed: () {
            print('2');
          },
          child: Text('编辑'),
        ),
        ElevatedButton(
          onPressed: () {
            print('3');
          },
          child: Text('删除'),
        ),
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
