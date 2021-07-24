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
