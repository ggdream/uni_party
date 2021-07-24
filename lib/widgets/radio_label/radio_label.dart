import 'package:flutter/material.dart';

class RadioLabelWidget extends StatefulWidget {
  const RadioLabelWidget({
    Key? key,
    required this.child,
    this.onChanged,
    this.textDirection,
  }) : super(key: key);

  final Widget child;

  final void Function(bool)? onChanged;
  final TextDirection? textDirection;

  @override
  _RadioLabelWidgetState createState() => _RadioLabelWidgetState();
}

class _RadioLabelWidgetState extends State<RadioLabelWidget> {
  bool _status = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      textDirection: widget.textDirection,
      children: [
        Switch(
          value: _status,
          onChanged: _changeStatus,
          activeColor: Theme.of(context).primaryColor,
        ),
        Expanded(child: widget.child),
      ],
    );
  }

  void _changeStatus(bool value) {
    setState(() {
      _status = value;
    });

    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }
}
