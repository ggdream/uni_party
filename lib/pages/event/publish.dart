import 'package:flutter/material.dart';

class PublishTypeSelected extends StatelessWidget {
  const PublishTypeSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          PublishTypeSelectedItem(
            asset: 'assets/icons/events/notice.png',
            label: '通知',
            value: PublishType.notice,
          ),
          PublishTypeSelectedItem(
            asset: 'assets/icons/events/vote.png',
            label: '投票',
            value: PublishType.vote,
          ),
          PublishTypeSelectedItem(
            asset: 'assets/icons/events/sortition.png',
            label: '抽签',
            value: PublishType.sortition,
          ),
          PublishTypeSelectedItem(
            asset: 'assets/icons/events/participation.png',
            label: '报名',
            value: PublishType.participation,
          ),
        ],
      ),
    );
  }
}

/// type of the event that was published
enum PublishType {
  /// 通知
  notice,

  /// 投票
  vote,

  /// 抽选
  sortition,

  /// 报名
  participation,
}

class PublishTypeSelectedItem extends StatelessWidget {
  const PublishTypeSelectedItem({
    Key? key,
    required this.asset,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String asset;
  final String label;
  final PublishType value;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(8),
      color: Theme.of(context).primaryColor,
      elevation: 6,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(value),
        child: Container(
          width: 64,
          height: 64,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                asset,
                width: 36,
                height: 36,
              ),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
