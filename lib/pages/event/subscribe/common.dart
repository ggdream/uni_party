import 'package:flutter/material.dart';
import 'package:uni_party/components/rounded/rounded.dart';

class TopView extends StatelessWidget {
  const TopView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          BackButton(),
          Spacer(),
          userTextInfoView(),
          SizedBox(width: 12),
          RoundedAvatar.asset(
            'assets/images/avatar.jpg',
            size: 48,
          ),
        ],
      ),
    );
  }

  Widget userTextInfoView() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '魔咔啦咔',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '你想做什么必须给我说清楚',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

