import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:uni_party/components/rich_shower/rich_shower.dart';
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
    return Container(
      height: kBottomNavigationBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
    );
  }

  Widget fileNumberView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.file_copy_outlined,
          size: 30,
        ),
        Text(commentCounter.toString()),
      ],
    );
  }

  Widget commentCounterView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.mode_comment_outlined,
          size: 30,
        ),
        Text(files.toString()),
      ],
    );
  }

  Widget shareEventBtn() {
    return IconButton(
      onPressed: () async {
        await ShareX.text('data');
      },
      icon: Icon(Icons.share_rounded),
    );
  }

  Widget collectBtn() {
    return IconButton(
      icon: Icon(
        isCollect
            ? Icons.collections_bookmark_rounded
            : Icons.collections_bookmark_outlined,
        size: 30,
        color: isCollect ? Colors.red[300] : null,
      ),
      onPressed: _collectBtnClick,
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
        Icon(
          isGet ? Icons.favorite_rounded : Icons.favorite_border_rounded,
          size: 30,
          color: isGet ? Colors.red[300] : null,
        ),
        Text(getCounter.toString()),
      ],
    );
  }

  Widget mainContentView() {
    return Expanded(
      child: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: RichShower(
              text:
                  '哈喽[百度](http://baidu.com)\n\n啊这，\n\n![](https://c-ssl.duitang.com/uploads/item/202003/03/20200303075755_pqhfy.thumb.1000_0.jpg)哈喽[百度](http://baidu.com)\n\n啊这，\n\n![](https://c-ssl.duitang.com/uploads/item/202003/03/20200303075755_pqhfy.thumb.1000_0.jpg)哈喽[百度](http://baidu.com)\n\n啊这，\n\n![](https://c-ssl.duitang.com/uploads/item/202003/03/20200303075755_pqhfy.thumb.1000_0.jpg)哈喽[百度](http://baidu.com)\n\n啊这，\n\n![](https://c-ssl.duitang.com/uploads/item/202003/03/20200303075755_pqhfy.thumb.1000_0.jpg)哈喽[百度](http://baidu.com)\n\n啊这，\n\n![](https://c-ssl.duitang.com/uploads/item/202003/03/20200303075755_pqhfy.thumb.1000_0.jpg)哈喽[百度](http://baidu.com)\n\n啊这，\n\n[阿哲](https://www.baidu.com)'),
        ),
      ),
    );
  }

  Widget contentMetaInfoView() {
    return SizedBox(
      width: double.infinity,
      height: 48,
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
