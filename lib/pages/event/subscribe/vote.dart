import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:uni_party/widgets/dialog/dialog.dart';
import 'package:uni_party/widgets/rich_shower/rich_shower.dart';
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

  String eid = '';
  String title = '';

  bool isJoin = true;

  late final int _allowedNumber;
  late final List<String> _options;
  late final List<bool> _myAnswer;
  int _myAnswerCounter = 0;
  String deadline = '2021-02-25 13:33';

  @override
  void initState() {
    super.initState();

    _allowedNumber = 1;
    _options = ['你是男生吗', '你是大学生吗', '你是大学生吗2'];
    // _myAnswer = List.generate(_options.length, (index) => false);
    _myAnswer = [true, false, true];
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
            datetime: '22:56',
            watchCounter: 12,
          ),
          mainContentView(),
          _SubActionsView(
            eid: eid,
            title: title,
            isVote: true,
            isCollect: isCollect,
            voteCounter: 20,
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
        child: isJoin ? voteJoinView() : voteUnjoinView(),
      ),
    );
  }

  Widget voteUnjoinView() {
    return Column(
      children: [
        voteChipsView(),
        SizedBox(height: 24),
        deadlineView(),
        SizedBox(height: 8),
        voteSubmitBtn(),
      ],
    );
  }

  Widget deadlineView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [Text('截止时间：$deadline')],
    );
  }

  Widget voteJoinView() {
    return Column(
      children: [
        Column(
            children: List.generate(
          _options.length,
          (index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: ColorsX.green,
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              title: Text(_options[index]),
              subtitle: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: 0.8,
                  minHeight: 8,
                  color: Colors.black87,
                  backgroundColor: ColorsX.green,
                ),
              ),
              trailing: _myAnswer[index]
                  ? Icon(
                      Icons.mark_email_read_rounded,
                      color: ColorsX.pink,
                    )
                  : SizedBox(
                      width: 24,
                    ),
            );
          },
        )),
        SizedBox(height: 12),
        deadlineView(),
        SizedBox(height: 8),
      ],
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
}

class _SubActionsView extends StatelessWidget {
  const _SubActionsView({
    Key? key,
    required this.eid,
    required this.title,
    required this.voteCounter,
    required this.isVote,
    required this.isCollect,
  }) : super(key: key);

  final String eid;
  final String title;

  final int voteCounter;

  final bool isVote;
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
              color: isVote ? ColorsX.pink : Colors.white,
            ),
          ),
          Text(
            voteCounter.toString(),
            style: TextStyle(
              color: isVote ? ColorsX.pink : Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
