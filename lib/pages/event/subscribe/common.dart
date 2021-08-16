import 'package:flutter/material.dart';

import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/widgets/button/button.dart';
import 'package:uni_party/widgets/rounded/rounded.dart';

class TopView extends StatelessWidget {
  const TopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          BackBtn(),
          Spacer(),
          userTextInfoView(),
          SizedBox(width: 12),
          RoundedAvatar.asset(
            'assets/images/avatar.jpg',
            size: 48,
          ),
        ],
      ),
    );
  }

  Widget userTextInfoView() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '魔咔啦咔',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '你想做什么必须给我说清楚',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class ContentMetaInfoWidget extends StatelessWidget {
  const ContentMetaInfoWidget({
    Key? key,
    required this.datetime,
    required this.watchCounter,
  }) : super(key: key);

  final String datetime;
  final int watchCounter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RawChip(
            backgroundColor: Colors.black,
            avatar: Icon(
              Icons.date_range_rounded,
              color: Colors.white,
            ),
            label: Text(
              datetime,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          RawChip(
            avatar: Icon(Icons.visibility_rounded),
            label: Text(watchCounter.toString()),
          ),
        ],
      ),
    );
  }
}

class WatchWidget extends StatefulWidget {
  const WatchWidget({
    Key? key,
    required this.isCollect,
  }) : super(key: key);

  final bool isCollect;

  @override
  _WatchWidgetState createState() => _WatchWidgetState();
}

class _WatchWidgetState extends State<WatchWidget> {
  late bool isCollect;

  @override
  void initState() {
    super.initState();
    isCollect = widget.isCollect;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isCollect
          ? Icon(
              Icons.visibility_rounded,
              color: ColorsX.pink,
            )
          : Icon(Icons.visibility_outlined),
      onPressed: _collectBtnClick,
      tooltip: '关注',
    );
  }

  Future<void> _collectBtnClick() async {
    setState(() {
      isCollect = !isCollect;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCollect ? '关注成功' : '取消关注成功'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
