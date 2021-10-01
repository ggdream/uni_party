import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:suit/suit.dart';

import 'package:uni_party/widgets/button/button.dart';

class ProfileVideoCollectPage extends StatefulWidget {
  const ProfileVideoCollectPage({Key? key}) : super(key: key);

  @override
  _ProfileVideoCollectPageState createState() =>
      _ProfileVideoCollectPageState();
}

class _ProfileVideoCollectPageState extends State<ProfileVideoCollectPage> {
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
      title: Text('我收藏的视频'),
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
        SizedBox(height: 4),
        bottomView(),
      ],
    );
  }

  Widget bottomView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 4),
            RawChip(
              backgroundColor: Colors.black,
              avatar: Icon(
                Icons.date_range_rounded,
                color: Colors.white,
              ),
              label: Text(
                // 收藏时间
                '2021-06-27 12:43',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 4),
            RawChip(
              avatar: Icon(Icons.palette_rounded),
              label: Text('萌宠'),
            ),
          ],
        ),
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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了不知不觉四年过去了',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RawChip(
                  avatar: Icon(Icons.access_time_filled_rounded),
                  label: Text('06:05'),
                ),
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
            'https://cdn.jsdelivr.net/gh/mocaraka/assets/temp/845.jpg',
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

class ShowDataChip extends StatelessWidget {
  const ShowDataChip({
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
