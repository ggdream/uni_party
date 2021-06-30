import 'package:flutter/material.dart';

import 'shell.dart';

Future<String?> showSimpleInputDialogX(
    BuildContext context, String title) async {
  return await showDialogX<String>(
    context,
    _InputDialogView(
      title: title,
    ),
  );
}

class _InputDialogView extends StatelessWidget {
  _InputDialogView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
        ),
        cursorColor: Colors.black,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(_controller.text),
          child: Text('确定'),
          style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}
