import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:uni_party/components/dialog/dialog.dart';
import 'package:uni_party/components/rich_shower/rich_shower.dart';
import 'package:uni_party/styles/styles.dart';
import 'package:uni_party/tools/sharex/sharex.dart';

import 'common.dart';

class EventSubscribeVotePage extends StatefulWidget {
  const EventSubscribeVotePage({Key? key}) : super(key: key);

  @override
  _EventSubscribeVotePageState createState() => _EventSubscribeVotePageState();
}

class _EventSubscribeVotePageState extends State<EventSubscribeVotePage> {
  bool isGet = false;
  int getCounter = 302;
  int commentCounter = 65;

  int files = 5;

  bool isCollect = false;

  late final int _allowedNumber;
  late final List<String> _options;
  late final List<bool> _myAnswer;
  int _myAnswerCounter = 0;

  @override
  void initState() {
    super.initState();

    _allowedNumber = 1;
    _options = ['你是男生吗', '你是大学生吗', '你是大学生吗2'];
    _myAnswer = List.generate(_options.length, (index) => false);
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
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imGetView(),
            SizedBox(width: 16),
            commentCounterView(),
            SizedBox(width: 16),
            Spacer(),
            collectBtn(),
            shareEventBtn(),
          ],
        ),
      ),
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
            child: Column(
              children: [
                RichShower(text: 'hello'),
                SizedBox(height: 64),
                dividerBetweenTextAndVoteView(),
                SizedBox(height: 32),
                voteView(),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dividerBetweenTextAndVoteView() {
    return Row(
      children: [
        SizedBox(width: 24),
        Expanded(child: Divider()),
        Container(
          child: Text('下方为投票区'),
          margin: const EdgeInsets.symmetric(horizontal: 16),
        ),
        Expanded(child: Divider()),
        SizedBox(width: 24),
      ],
    );
  }

  Widget voteView() {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      elevation: 3,
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            voteChipsView(),
            SizedBox(height: 24),
            voteSubmitBtn(),
          ],
        ),
      ),
    );
  }

  Widget voteSubmitBtn() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _onSubmitClick,
        child: Text('提交'),
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.symmetric(vertical: 16),
          primary: ColorsX.primary,
          textStyle: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Future<void> _onSubmitClick() async {
    final status = await showConfirmDialogX(context, '确定提交投票信息？');
    if (status == null || !status) return;
  }

  Widget voteChipsView() {
    return Column(
        children: List.generate(
      _options.length,
      (index) {
        return CheckboxListTile(
          secondary: CircleAvatar(
            child: Text((index + 1).toString()),
          ),
          title: Text(_options[index]),
          value: _myAnswer[index],
          onChanged: (value) {
            if (value == null) return;

            // 上次操作后用户选中的数量等于限制数量，并且本次要选择的是未选中的
            if (_myAnswerCounter == _allowedNumber && !_myAnswer[index]) {
              // 如果投票是单选，那么取消原来选中的，改选为这个
              if (_allowedNumber == 1) {
                setState(() {
                  _myAnswer[_myAnswer.indexOf(true)] = false;
                  _myAnswer[index] = value;
                });
              }
              // 如果不是单选，就直接退出选中，UI上变现为无反应
              return;
            }

            setState(() {
              value ? _myAnswerCounter++ : _myAnswerCounter--;
              _myAnswer[index] = value;
            });
          },
        );
      },
    ));
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
