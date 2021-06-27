import 'package:flutter/material.dart';

import 'shell.dart';

Future<String?> showSimpleInputDialogX(BuildContext context, String title) async {
  return await showDialogX<String>(
    context,
    _InputDialogView(title: title,),
  );
}

class _InputDialogView extends StatelessWidget {
  const _InputDialogView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextFormField(),
    );
  }
}
