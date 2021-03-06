import 'package:flutter/material.dart';

export 'confirm.dart';
export 'shell.dart';
export 'input.dart';

Future<String?> showInputDialog(BuildContext context, String title) async {
  TextEditingController _controller = TextEditingController();
  return await showDialog<String>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: TextField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            focusColor: Colors.black,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
          ),
          controller: _controller,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(_controller.text),
            child: Text('确定'),
            style: TextButton.styleFrom(primary: Colors.red[100]),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('取消'),
            style: TextButton.styleFrom(primary: Colors.red[100]),
          )
        ],
      );
    },
  );
}
