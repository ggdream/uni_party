import 'package:flutter/material.dart';
import 'package:uni_party/components/rounded/avatar.dart';

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
        horizontal: 8,
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}
