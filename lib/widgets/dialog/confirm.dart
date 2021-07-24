import 'package:flutter/material.dart';

import 'shell.dart';

Future<bool?> showConfirmDialogX(
    BuildContext context, String title) async {
  return await showDialogX<bool>(
    context,
    _ConfirmView(
      title: title,
    ),
  );
}

class _ConfirmView extends StatelessWidget {
  _ConfirmView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('提示'),
      content: Text(title),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('确定'),
          style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('取消'),
          style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}
