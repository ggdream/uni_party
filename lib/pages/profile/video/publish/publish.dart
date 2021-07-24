import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suit/suit.dart';

import 'package:uni_party/widgets/button/button.dart';
import 'package:uni_party/styles/styles.dart';

class ProfileVideoPublishPage extends StatefulWidget {
  const ProfileVideoPublishPage({Key? key}) : super(key: key);

  @override
  _ProfileVideoPublishPageState createState() =>
      _ProfileVideoPublishPageState();
}

class _ProfileVideoPublishPageState extends State<ProfileVideoPublishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return ListView(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      children: [
        _VideoCollectCardWidget(),
        _VideoCollectCardWidget(),
        _VideoCollectCardWidget(),
        _VideoCollectCardWidget(),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: BackBtn(),
      title: Text('我发布的视频'),
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

class _VideoCollectCardWidget extends StatelessWidget {
  const _VideoCollectCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: mainBody(),
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  Widget mainBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        topView(),
        SizedBox(height: 8),
        bottomView(),
      ],
    );
  }

  Widget bottomView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _ShowDataChip(icon: IconImage.xihuan, counter: 206.toString()),
        _ShowDataChip(icon: IconImage.shangpin, counter: 45.toString()),
        _ShowDataChip(icon: IconImage.xiaoxi, counter: 3.toString()),
        SizedBox(width: 16),
        _MoreOperatesBtn(),
      ],
    );
  }

  Widget topView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 视频封面图显示
        coverView(),
        SizedBox(width: 6),
        // 右侧视频元数据展示，更多操作
        metaInfoView(),
      ],
    );
  }

  Widget metaInfoView() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 6),
            // 视频分区（类别）
            RawChip(
              backgroundColor: Colors.black,
              avatar: Icon(
                Icons.date_range_rounded,
                color: Colors.white,
              ),
              label: Text(
                '2021-06-27 12:43',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                RawChip(avatar: Icon(Icons.palette_rounded), label: Text('萌宠')),
                RawChip(
                    avatar: Icon(Icons.access_time_filled_rounded),
                    label: Text('06:05')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget coverView() {
    return Container(
      width: 32.vw,
      height: 32.vw,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'http://qvgbcgfc6.hn-bkt.clouddn.com/image/845.jpg',
          ),
        ),
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
      onSelected: onSelected,
      itemBuilder: (context) {
        return <PopupMenuEntry<_MoreOperate>>[
          PopupMenuItem(
            child: Text('分享'),
            value: _MoreOperate.share,
          ),
          PopupMenuItem(
            child: Text('删除'),
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
