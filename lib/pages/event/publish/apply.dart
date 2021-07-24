import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uni_party/widgets/sheet/sheet.dart';
import 'package:uni_party/styles/styles.dart';

import 'common.dart';

class EventPublishApplyPage extends StatefulWidget {
  const EventPublishApplyPage({Key? key}) : super(key: key);

  @override
  _EventPublishApplyPageState createState() => _EventPublishApplyPageState();
}

class _EventPublishApplyPageState extends State<EventPublishApplyPage> {
  final String _text = Get.arguments;

  String _number = '';
  String _datetime = '';
  bool _canCancel = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final time = DateTime.now().add(Duration(hours: 3));

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
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Column(
        children: [
          SizedBox(height: 16),
          finalNumberView(),
          deadlineView(),
          isMostView(),
        ],
      ),
    );
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
      child: deadlineBodyView(),
    );
  }

  Widget deadlineBodyView() {
    return Row(
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
    );
  }

  Widget finalNumberView() {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          labelText: '报名数量',
          labelStyle: TextStyle(color: Colors.grey),
          hintText: '请输入报名数量',
          hintStyle: TextStyle(color: Colors.grey),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
        onChanged: _onChange,
      ),
    );
  }

  void _onChange(String value) {
    setState(() {
      _number = value;
    });
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
      child: isMostBodyView(),
    );
  }

  Widget isMostBodyView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('允许用户取消报名'),
        Switch(
          value: _canCancel,
          activeColor: ColorsX.purple,
          onChanged: (value) {
            setState(() {
              _canCancel = value;
            });
          },
        ),
      ],
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

  String _parseTime(DateTime time) =>
      "${time.year}-${time.month < 10 ? '0' + time.month.toString() : time.month}-${time.day < 10 ? '0' + time.day.toString() : time.day} ${time.hour < 10 ? '0' + time.hour.toString() : time.hour}:${time.minute < 10 ? '0' + time.minute.toString() : time.minute}";
}
