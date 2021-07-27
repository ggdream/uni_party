import 'package:flutter/material.dart';
import 'package:suit/suit.dart';

import 'package:uni_party/widgets/rounded/avatar.dart';
import 'package:uni_party/styles/color.dart';

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({
    Key? key,
    required this.avatar,
    required this.text,
    required this.textDirection,
  }) : super(key: key);

  final String avatar;
  final String text;
  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 12,
      ),
      child: Row(
        textDirection: textDirection,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedAvatar.network(
            avatar,
            size: 40,
          ),
          SizedBox(width: 12),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: ColorsX.bluePurple,
                borderRadius: BorderRadius.circular(16),
              ),
              child: SelectableText(text),
            ),
          ),
        ],
      ),
    );
  }
}
