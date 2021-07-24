import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:uni_party/widgets/rich_shower/rich_shower.dart';
import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/tools/sharex/sharex.dart';

import 'common.dart';

class EventSubscribeRandomPage extends StatefulWidget {
  const EventSubscribeRandomPage({Key? key}) : super(key: key);

  @override
  _EventSubscribeRandomPageState createState() =>
      _EventSubscribeRandomPageState();
}

class _EventSubscribeRandomPageState extends State<EventSubscribeRandomPage> {
  int getCounter = 302;
  int commentCounter = 65;

  int files = 5;

  bool isCollect = false;
  bool isJoin = true;

  String eid = '';
  String title = '';

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
          TopView(),
          ContentMetaInfoWidget(
            datetime: 'datetime',
            watchCounter: 50,
          ),
          mainContentView(),
          _SubActionsView(
            eid: eid,
            title: title,
            voteCounter: 50,
            isJoin: isJoin,
            isCollect: isCollect,
          ),
        ],
      ),
    );
  }

  Widget mainContentView() {
    return Expanded(
      child: CupertinoScrollbar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: RichShower(
                text:
                    '哈喽[百度](http://baidu.com)\n\n啊这，\n\n![](https://c-ssl.duitang.com/uploads/item/202003/03/20200303075755_pqhfy.thumb.1000_0.jpg)哈喽[百度](http://baidu.com)\n\n啊这，\n\n![](https://c-ssl.duitang.com/uploads/item/202003/03/20200303075755_pqhfy.thumb.1000_0.jpg)哈喽[百度](http://baidu.com)\n\n啊这，\n\n![](https://c-ssl.duitang.com/uploads/item/202003/03/20200303075755_pqhfy.thumb.1000_0.jpg)哈喽[百度](http://baidu.com)\n\n啊这，\n\n![](https://c-ssl.duitang.com/uploads/item/202003/03/20200303075755_pqhfy.thumb.1000_0.jpg)哈喽[百度](http://baidu.com)\n\n啊这，\n\n![](https://c-ssl.duitang.com/uploads/item/202003/03/20200303075755_pqhfy.thumb.1000_0.jpg)哈喽[百度](http://baidu.com)\n\n啊这，\n\n[阿哲](https://www.baidu.com)'),
          ),
        ),
      ),
    );
  }

  Widget contentMetaInfoView() {
    return Container(
      width: double.infinity,
      height: 48,
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
              '2021-06-27 12:43',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          RawChip(
            avatar: Icon(Icons.visibility_rounded),
            label: Text('32.k'),
          ),
        ],
      ),
    );
  }
}

class _SubActionsView extends StatelessWidget {
  const _SubActionsView({
    Key? key,
    required this.eid,
    required this.title,
    required this.voteCounter,
    required this.isJoin,
    required this.isCollect,
  }) : super(key: key);

  final String eid;
  final String title;

  final int voteCounter;

  final bool isJoin;
  final bool isCollect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PhysicalModel(
        color: Colors.black,
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          alignment: Alignment.center,
          height: kBottomNavigationBarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Theme(
            data: ThemeData(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            child: mainView(),
          ),
        ),
      ),
    );
  }

  Widget mainView() {
    return Row(
      children: [
        voteCountView(),
        Spacer(),
        WatchWidget(isCollect: isCollect),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.message_rounded),
          tooltip: '交流',
        ),
        IconButton(
          icon: Icon(Icons.share_rounded),
          onPressed: () async {
            await ShareX.text('data');
          },
          tooltip: '分享',
        ),
      ],
    );
  }

  Widget voteCountView() {
    return Tooltip(
      message: '投票人数',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.people_alt_rounded,
              color: isJoin ? ColorsX.pink : Colors.white,
            ),
          ),
          Text(
            voteCounter.toString(),
            style: TextStyle(
              color: isJoin ? ColorsX.pink : Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
