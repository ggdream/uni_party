import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: color,
      ),
      onPressed: () => Navigator.of(context).pop(),
      tooltip: '返回',
    );
  }
}
