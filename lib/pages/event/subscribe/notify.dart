import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:uni_party/widgets/rich_shower/rich_shower.dart';
import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/tools/sharex/sharex.dart';

import 'common.dart';

class EventSubscribeNotifyPage extends StatefulWidget {
  const EventSubscribeNotifyPage({Key? key}) : super(key: key);

  @override
  _EventSubscribeNotifyPageState createState() =>
      _EventSubscribeNotifyPageState();
}

class _EventSubscribeNotifyPageState extends State<EventSubscribeNotifyPage> {
  bool isGet = false;
  int getCounter = 302;
  int commentCounter = 65;

  int files = 5;

  bool isCollect = false;
  String eid = 's';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        isGet = true;
        _autoGet();
      });
    });
  }

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
            datetime: '2021-06-27 12:43',
            watchCounter: 62,
          ),
          mainContentView(),
          _SubActionsView(
            eid: eid,
            title: '',
            fileCounter: 5,
            isCollect: isCollect,
          ),
        ],
      ),
    );
  }

  Future<void> _autoGet() async {}

  Widget imGetView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          IconImage.biaoqing,
          width: 32,
        ),
        Text(getCounter.toString()),
      ],
    );
  }

  Widget mainContentView() {
    return Expanded(
      child: CupertinoScrollbar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: RichShower(text: """关于狮子山校区医院6月22日集中接种第二剂新冠疫苗的通知
各位师生员工：\n\n
狮子山校区医院将于6月22日集中接种新冠疫苗，具体安排如下： \n
1.接种时间：6月22日（星期二）14:00–17:00\n
2.接种地点：狮子山校区医院；\n
狮子山校区医院将于6月22日集中接种新冠疫苗，具体安排如下： \n
1.接种时间：6月22日（星期二）14:00–17:00\n
2.接种地点：狮子山校区医院；\n
狮子山校区医院将于6月22日集中接种新冠疫苗，具体安排如下： \n
1.接种时间：6月22日（星期二）14:00–17:00\n
2.接种地点：狮子山校区医院；\n
狮子山校区医院将于6月22日集中接种新冠疫苗，具体安排如下： \n
1.接种时间：6月22日（星期二）14:00–17:00\n
2.接种地点：狮子山校区医院；\n
狮子山校区医院将于6月22日集中接种新冠疫苗，具体安排如下： \n
1.接种时间：6月22日（星期二）14:00–17:00\n
2.接种地点：狮子山校区医院；\n
狮子山校区医院将于6月22日集中接种新冠疫苗，具体安排如下： \n
1.接种时间：6月22日（星期二）14:00–17:00\n
2.接种地点：狮子山校区医院；\n
3.相关要求：6月1号前（包含6月1号）接种了第一剂（北京生物、成都生物）的18-59岁师生员工，请携带身份证按通知要求前往。\n
4.温馨提示：必须间隔满21天，微信小程序“天府健康通”可查阅接种信息。
![](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fstatics.qdxin.cn%2Fuploadfile%2F2020%2F0127%2F20200127115259494.jpg&refer=http%3A%2F%2Fstatics.qdxin.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627898306&t=a64cb53eac7ae5a4ea73b02f3d7d45ce)
"""),
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
    required this.fileCounter,
    required this.isCollect,
  }) : super(key: key);

  final String eid;
  final String title;

  final int fileCounter;
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
        fileCountView(),
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

  Widget fileCountView() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.file_copy_rounded),
          tooltip: '附带文件',
        ),
        Text(
          fileCounter.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
