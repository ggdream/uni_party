import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:uni_party/widgets/rich_shower/rich_shower.dart';
import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/tools/sharex/sharex.dart';

import 'common.dart';

class EventSubscribeApplyPage extends StatefulWidget {
  const EventSubscribeApplyPage({Key? key}) : super(key: key);

  @override
  _EventSubscribeApplyPageState createState() =>
      _EventSubscribeApplyPageState();
}

class _EventSubscribeApplyPageState extends State<EventSubscribeApplyPage> {
  int getCounter = 302;
  int commentCounter = 65;

  int files = 5;

  bool isCollect = false;
  bool isJoin = true;

  String eid = '';
  String title = '';

  int randomCounter = 2;
  String deadline = '2021-07-05 13:40';
  bool allowCancel = true;

  bool isEnd = true;

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
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: RawChip(
              label: Text(
                isEnd ? '已截止参与报名' : '截止时间：$deadline',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ),
          ),
          mainContentView(),
          _SubActionsView(
            eid: eid,
            title: title,
            voteCounter: 50,
            isJoin: isJoin,
            isCollect: isCollect,
            isEnd: false,
            hasMe: false,
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
}

class _SubActionsView extends StatelessWidget {
  const _SubActionsView({
    Key? key,
    required this.eid,
    required this.title,
    required this.voteCounter,
    required this.isJoin,
    required this.isCollect,
    required this.isEnd,
    required this.hasMe,
  }) : super(key: key);

  final String eid;
  final String title;

  final int voteCounter;

  final bool isJoin;
  final bool isCollect;

  final bool isEnd;
  final bool hasMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
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
        isEnd
            ? randomHasMeView()
            : _JoinItWidget(
                isJoin: isJoin,
                currentCount: 2,
                totalCount: 10,
              ),
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

  Widget randomHasMeView() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: hasMe ? ColorsX.green : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(hasMe ? '上榜' : '落榜'),
    );
  }
}

class _JoinItWidget extends StatefulWidget {
  const _JoinItWidget({
    Key? key,
    required this.isJoin,
    required this.currentCount,
    required this.totalCount,
  }) : super(key: key);

  final bool isJoin;
  final int currentCount;
  final int totalCount;

  @override
  _JoinItWidgetState createState() => _JoinItWidgetState();
}

class _JoinItWidgetState extends State<_JoinItWidget> {
  late bool isJoin;
  late int currentCount;
  late final int totalCount;

  @override
  void initState() {
    super.initState();
    isJoin = widget.isJoin;
    currentCount = widget.currentCount;
    totalCount = widget.totalCount;
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '投票人数',
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: isJoin ? ColorsX.pink : Colors.white,
            onPrimary: Colors.black,
          ),
          onPressed: () {
            setState(() {
              isJoin = !isJoin;
              isJoin ? currentCount++ : currentCount--;
            });
          },
          child: showBtnContentView(),
        ),
      ),
    );
  }

  Widget showBtnContentView() {
    final text = Text('取消  $currentCount/$totalCount',
        style: TextStyle(color: Colors.white));
    final text2 = Text('参加  $currentCount/$totalCount',
        style: TextStyle(color: Colors.black));
    return isJoin ? text : text2;
  }
}
