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
          contentMetaInfoView(),
          mainContentView(),
          bottomActionsView(),
        ],
      ),
    );
  }

  Widget bottomActionsView() {
    return PhysicalModel(
      color: Colors.white,
      elevation: 3,
      child: Container(
        alignment: Alignment.center,
        height: kBottomNavigationBarHeight * 1.6,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imGetView(),
            SizedBox(width: 16),
            commentCounterView(),
            SizedBox(width: 16),
            fileNumberView(),
            Spacer(),
            collectBtn(),
            shareEventBtn(),
          ],
        ),
      ),
    );
  }

  Widget fileNumberView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {},
          child: Tooltip(
            message: '附件',
            child: SvgPicture.asset(
              IconImage.fujian,
              width: 32,
            ),
          ),
        ),
        Text(commentCounter.toString()),
      ],
    );
  }

  Widget commentCounterView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {},
          child: Tooltip(
            message: '评论',
            child: SvgPicture.asset(
              IconImage.xinxi,
              width: 32,
            ),
          ),
        ),
        Text(files.toString()),
      ],
    );
  }

  Widget shareEventBtn() {
    return IconButton(
      icon: SvgPicture.asset(
        IconImage.fenxiang,
        width: 32,
      ),
      onPressed: () async {
        await ShareX.text('data');
      },
      tooltip: '分享',
    );
  }

  Widget collectBtn() {
    return IconButton(
      icon: SvgPicture.asset(
        IconImage.bangong,
        width: 32,
        color: isCollect ? null : ColorsX.inactive,
      ),
      onPressed: _collectBtnClick,
      tooltip: '收藏',
    );
  }

  Future<void> _collectBtnClick() async {
    setState(() {
      isCollect = !isCollect;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isCollect ? '收藏成功' : '取消收藏成功'),
        duration: Duration(seconds: 1),
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
3.相关要求：6月1号前（包含6月1号）接种了第一剂（北京生物、成都生物）的18-59岁师生员工，请携带身份证按通知要求前往。\n
4.温馨提示：必须间隔满21天，微信小程序“天府健康通”可查阅接种信息。
![](https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fstatics.qdxin.cn%2Fuploadfile%2F2020%2F0127%2F20200127115259494.jpg&refer=http%3A%2F%2Fstatics.qdxin.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1627898306&t=a64cb53eac7ae5a4ea73b02f3d7d45ce)
"""),
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
