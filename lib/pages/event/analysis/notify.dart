import 'package:flutter/material.dart';

import 'package:uni_party/widgets/button/button.dart';
import 'package:uni_party/widgets/rounded/rounded.dart';
import 'package:uni_party/widgets/sex/sex.dart';

class EventAnalysisNotifyPage extends StatefulWidget {
  const EventAnalysisNotifyPage({Key? key}) : super(key: key);

  @override
  _EventAnalysisNotifyPageState createState() =>
      _EventAnalysisNotifyPageState();
}

class _EventAnalysisNotifyPageState extends State<EventAnalysisNotifyPage> {
  _SortType _currentSortType = _SortType.late2early;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: [
          _UserCardWidget(),
          _UserCardWidget(),
          _UserCardWidget(),
          _UserCardWidget(),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: BackBtn(),
      title: Text('消息分析'),
      centerTitle: true,
      actions: [
        _SelectSortTypeBtn(
          type: _currentSortType,
          onSelected: _onChangeSortType,
        ),
        SizedBox(width: 12),
      ],
    );
  }

  Future<void> _onChangeSortType(value) async {
    setState(() {
      _currentSortType = value;
    });
  }
}

class _UserCardWidget extends StatelessWidget {
  const _UserCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: RoundedAvatar.network(
          'http://qy7zrkdso.hn-bkt.clouddn.com/image/228.jpg',
          size: 48,
        ),
        title: unameAndSexView(),
        subtitle: Text('2021-07-02 21:29'),
      ),
    );
  }

  Widget unameAndSexView() {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        children: [
          WidgetSpan(
            child: SexView(isMan: true),
          ),
          WidgetSpan(child: SizedBox(width: 2)),
          TextSpan(text: '人鱼公主沙耶香'),
        ],
      ),
    );
  }
}

enum _SortType {
  late2early,
  early2late,
}

class _SelectSortTypeBtn extends StatelessWidget {
  const _SelectSortTypeBtn({
    Key? key,
    required this.type,
    required this.onSelected,
  }) : super(key: key);

  final _SortType type;
  final void Function(_SortType) onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_SortType>(
      tooltip: '排序方式',
      onSelected: onSelected,
      icon: Icon(Icons.sort_rounded),
      itemBuilder: (context) {
        return <PopupMenuEntry<_SortType>>[
          CheckedPopupMenuItem(
            child: Text('时间从晚到早'),
            value: _SortType.late2early,
            checked: type == _SortType.late2early,
          ),
          CheckedPopupMenuItem(
            child: Text('时间从晚到早'),
            value: _SortType.early2late,
            checked: type == _SortType.early2late,
          ),
        ];
      },
    );
  }
}
