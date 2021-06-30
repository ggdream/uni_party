import 'package:flutter/material.dart';
import 'package:uni_party/logic/event/event.dart';

class EventPublishTypeSelected extends StatelessWidget {
  const EventPublishTypeSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          EventPublishTypeSelectedItem(
            asset: 'assets/icons/events/notice.png',
            label: '通知',
            value: EventPublishType.notice,
          ),
          EventPublishTypeSelectedItem(
            asset: 'assets/icons/events/vote.png',
            label: '投票',
            value: EventPublishType.vote,
          ),
          EventPublishTypeSelectedItem(
            asset: 'assets/icons/events/sortition.png',
            label: '抽签',
            value: EventPublishType.sortition,
          ),
          EventPublishTypeSelectedItem(
            asset: 'assets/icons/events/participation.png',
            label: '报名',
            value: EventPublishType.participation,
          ),
        ],
      ),
    );
  }
}

class EventPublishTypeSelectedItem extends StatelessWidget {
  const EventPublishTypeSelectedItem({
    Key? key,
    required this.asset,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String asset;
  final String label;
  final EventPublishType value;

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
