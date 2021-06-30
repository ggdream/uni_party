import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/components/dialog/dialog.dart';
import 'package:uni_party/components/sheet/sheet.dart';
import 'package:uni_party/components/snackbar/snackbar.dart';
import 'package:uni_party/styles/styles.dart';

import 'common.dart';

class EventPublishVotePage extends StatefulWidget {
  const EventPublishVotePage({Key? key}) : super(key: key);

  @override
  _EventPublishVotePageState createState() => _EventPublishVotePageState();
}

class _EventPublishVotePageState extends State<EventPublishVotePage> {
  final String _text = Get.arguments;
  String _datetime = '';

  int _voteLimit = 1;
  String _voteLimitShow = '单选';

  bool _isMost = false;
  bool _isAnonymous = false;

  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  String _parseTime(DateTime time) =>
      "${time.year}-${time.month < 10 ? '0' + time.month.toString() : time.month}-${time.day < 10 ? '0' + time.day.toString() : time.day} ${time.hour < 10 ? '0' + time.hour.toString() : time.hour}:${time.minute < 10 ? '0' + time.minute.toString() : time.minute}";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final time = DateTime.now().add(Duration(hours: 1));

      setState(() {
        _datetime = _parseTime(time);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(onPressed: () {}),
      body: bodyView(),
    );
  }

  Widget bodyView() {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            addOptionsView(),
            addOptionBtn(),
            SizedBox(height: 96),
            deadlineView(),
            allowedNumberView(),
            isMostView(),
            isAnonymousView(),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget addOptionBtn() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _addOptionClick,
        child: Text('添加选项'),
      ),
    );
  }

  void _addOptionClick() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  Widget deadlineView() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '截止时间',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
              Text(
                _datetime,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(
            onPressed: _selectDeadlineClick,
            icon: Icon(
              Icons.date_range_rounded,
              color: ColorsX.purple,
            ),
          ),
        ],
      ),
    );
  }

  Widget allowedNumberView() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '投票数量',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
              Text(
                _voteLimitShow,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          _SureAllowedNUmberBtn(onSelected: _allowedNumberClick)
        ],
      ),
    );
  }

  Widget isMostView() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('投票数量是否为上限'),
          Switch(
            value: _isMost,
            activeColor: ColorsX.purple,
            onChanged: (value) {
              setState(() {
                _isMost = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget isAnonymousView() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('是否匿名'),
          Switch(
            value: _isAnonymous,
            activeColor: ColorsX.purple,
            onChanged: (value) {
              setState(() {
                _isAnonymous = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Future<void> _selectDeadlineClick() async {
    await showBottomSheetX(
      context,
      CupertinoDatePicker(
        mode: CupertinoDatePickerMode.dateAndTime,
        minimumDate: DateTime.now(),
        maximumDate: DateTime.now().add(Duration(days: 7)),
        use24hFormat: true,
        onDateTimeChanged: (DateTime time) => setState(
          () => _datetime = _parseTime(time),
        ),
      ),
    );
  }

  Future<void> _allowedNumberClick(int value) async {
    if (value == -1) {
      setState(() {
        _voteLimitShow = '无限制';
      });
    } else if (value == 0) {
      final res = await showSimpleInputDialogX(context, '输入可投票数量');
      if (res == null) return;
      final num = int.tryParse(res);
      if (num == null) {
        SnackBarX.showRaw(context, '输入有误，请输入数字');
        return;
      }

      setState(() {
        _voteLimit = num;
        _voteLimitShow = num.toString();
      });
    } else {
      setState(() {
        _voteLimit = value;
        _voteLimitShow = value.toString();
      });
    }
  }

  Widget addOptionsView() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: _genTextFieldOfOptions(),
      ),
    );
  }

  List<Widget> _genTextFieldOfOptions() {
    return List.generate(
      _controllers.length,
      (index) {
        return TextField(
          cursorColor: Theme.of(context).primaryColor,
          controller: _controllers[index],
          decoration: InputDecoration(
            hintText: '选项 ${index + 1}',
            suffixIcon: IconButton(
              onPressed: () {
                if (_controllers.length == 2) {
                  SnackBarX.showRaw(context, '要求最少两个选项');
                  return;
                }
                setState(() {
                  _controllers.removeAt(index);
                });
              },
              icon: Icon(Icons.highlight_remove_rounded),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
        );
      },
    );
  }
}

class _SureAllowedNUmberBtn extends StatelessWidget {
  const _SureAllowedNUmberBtn({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  final void Function(int) onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      child: Container(
        child: Icon(
          Icons.arrow_circle_down_rounded,
          color: ColorsX.purple,
        ),
        margin: const EdgeInsets.only(right: 8),
      ),
      onSelected: onSelected,
      itemBuilder: (context) {
        return <PopupMenuEntry<int>>[
          PopupMenuItem(
            child: Text('单选'),
            value: 1,
          ),
          PopupMenuItem(
            child: Text('双选'),
            value: 2,
          ),
          PopupMenuItem(
            child: Text('三选'),
            value: 3,
          ),
          PopupMenuItem(
            child: Text('自定义'),
            value: 0,
          ),
          PopupMenuItem(
            child: Text('无限制'),
            value: -1,
          ),
        ];
      },
    );
  }
}
